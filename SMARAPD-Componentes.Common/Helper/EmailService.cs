using System.IO;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;

namespace SMARAPD_Componentes.Common.Helper
{
    public class EmailService
    {
        private readonly string TemplatesPath = "..\\SMARAPD-Componentes.Common\\Templates";

        private readonly EmailConfig _emailConfig;

        private SmtpClient SmtpClient { get; set; }

        public EmailService(EmailConfig emailConfig)
        {
            _emailConfig = emailConfig;
        }

        public async Task SendConfirmationEmail(string destinatario)
        {
            ConfigureSmtpClient();

            string template = File.ReadAllText(Path.Combine(TemplatesPath, "cadastro.html"));

            var mailMessage = new MailMessage
            {
                From = new MailAddress(_emailConfig.Email, _emailConfig.DisplayName),
                Subject = "Confirmação de cadastro - SMARAPD Componentes",
                Body = template,
                IsBodyHtml = true
            };
            mailMessage.To.Add(destinatario);

            using (SmtpClient)
            {
                await SmtpClient.SendMailAsync(mailMessage);
            }
        }

        public async Task SendAuthorizedEmail(string destinatario)
        {
            ConfigureSmtpClient();

            string template = File.ReadAllText(Path.Combine(TemplatesPath, "autorizado.html"));

            var mailMessage = new MailMessage
            {
                From = new MailAddress(_emailConfig.Email, _emailConfig.DisplayName),
                Subject = "Acesso autorizado ao SmarDocs",
                Body = template,
                IsBodyHtml = true
            };
            mailMessage.To.Add(destinatario);

            using (SmtpClient)
            {
                await SmtpClient.SendMailAsync(mailMessage);
            }
        }

        public async Task SendAuthorizeRequestEmail(string userEmail)
        {
            ConfigureSmtpClient();

            string template = File.ReadAllText(Path.Combine(TemplatesPath, "autorizacao.html"));
            template = template.Replace("{email}", userEmail);

            var mailMessage = new MailMessage
            {
                From = new MailAddress(_emailConfig.Email, _emailConfig.DisplayName),
                Subject = "Requisição de acesso ao SmarDocs",
                Body = template,
                IsBodyHtml = true
            };
            mailMessage.To.Add(_emailConfig.Email);

            using (SmtpClient)
            {
                await SmtpClient.SendMailAsync(mailMessage);
            }
        }

        private void ConfigureSmtpClient()
        {
            SmtpClient = new SmtpClient
            {
                Host = _emailConfig.Host,
                Port = _emailConfig.Port,
                EnableSsl = _emailConfig.UseSSL,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(_emailConfig.Email, _emailConfig.Password)
            };
        }
    }
}
