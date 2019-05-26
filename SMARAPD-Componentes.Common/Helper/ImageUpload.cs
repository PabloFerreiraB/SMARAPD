using SixLabors.ImageSharp;
using SixLabors.ImageSharp.Formats.Jpeg;
using SixLabors.ImageSharp.Formats.Png;
using SixLabors.ImageSharp.PixelFormats;
using SMARAPD_Componentes.Common.Exceptions;
using System;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;

namespace SMARAPD_Componentes.Common.Helper
{
    public class ImageUpload
    {
        private static string[] AcceptedMediaType = { "image/jpeg", "image/png" };

        private readonly ImageConfig _imageServer;

        public ImageUpload(ImageConfig imageServer)
        {
            _imageServer = imageServer;
        }

        public string SaveImage(string imageBase64)
        {
            var mediaType = GetMediaType(imageBase64);
            var result = 4 * Math.Ceiling((double)GetImageBytes(imageBase64).Length / 3);
            if (result > _imageServer.MaxSize)
                throw new DomainException("Imagem excede o tamanho permitido.");
            if (VerifyMediaType(mediaType))
                throw new DomainException("Tipo de imagem inválido.");

            byte[] bytes = GetImageBytes(imageBase64);
            var (image, fileName) = GetImageFromBytes(mediaType, bytes);
            var path = Path.Combine(_imageServer.LocalPath, fileName);

            using (var stream = new FileStream(path, FileMode.Create))
            {
                if (mediaType.Equals("image/png"))
                    image.Save(stream, new PngEncoder());
                image.Save(stream, new JpegEncoder());
            }
            return Path.Combine(_imageServer.Server, fileName);
        }

        public void DeleteImage(string imageUrl)
        {
            var filename = Path.GetFileName(imageUrl);
            if (File.Exists(Path.Combine(_imageServer.LocalPath, filename)))
                File.Delete(Path.Combine(_imageServer.LocalPath, filename));
        }

        public static bool VerifyMediaType(string base64Image)
        {
            return AcceptedMediaType.Any(x => x == GetMediaType(base64Image));
        }

        public static byte[] GetImageBytes(string base64String)
        {
            var regexBase64Header = new Regex(@"data:\w+/[-+.\w]+;base64,");
            string noHeader = regexBase64Header.Replace(base64String, string.Empty);
            string converted = noHeader?.Replace('-', '+').Replace('_', '/');
            return Convert.FromBase64String(converted);
        }

        public static string GetMediaType(string base64String)
        {
            var regexBase64Header = new Regex(@"data:\w+/[-+.\w]+;base64,");
            var base64Header = regexBase64Header.Match(base64String).Value;
            var regexMediaType = new Regex(@"\w+/[-+.\w]+");
            return regexMediaType.Match(base64Header)?.Value;
        }

        public static (Image<Rgba32>, string) GetImageFromBytes(string imageType, byte[] imageBytes)
        {
            if (imageType.Equals("image/png"))
            {
                try
                {
                    return (Image.Load<Rgba32>(imageBytes, new PngDecoder()), Guid.NewGuid().ToString() + ".png");
                }
                catch (Exception)
                {
                    throw new DomainException("Não foi possivel salvar esta imagem");
                }
            }
            if (imageType.Equals("image/jpeg"))
            {
                try
                {
                    return (Image.Load<Rgba32>(imageBytes, new JpegDecoder()), Guid.NewGuid().ToString() + ".jpg");
                }
                catch (Exception)
                {
                    throw new DomainException("Não foi possivel salvar esta imagem");
                }

            }
            throw new DomainException("Formato de imagem inválido");
        }
    }
}
