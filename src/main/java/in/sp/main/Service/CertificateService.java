package in.sp.main.Service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

@Service
public class CertificateService {

    private final String certificatePath;

    public CertificateService(
            @Value("${app.certificates.dir:}") String configuredDir) {
        if (configuredDir != null && !configuredDir.isBlank()) {
            this.certificatePath = configuredDir.endsWith(File.separator)
                    ? configuredDir
                    : configuredDir + File.separator;
        } else {
            this.certificatePath = System.getProperty("user.dir")
                    + File.separator + "uploads"
                    + File.separator + "certificates"
                    + File.separator;
        }
    }

    public String generateCertificate(String userName, String courseName) {
        try {
            File certDir = new File(certificatePath);
            if (!certDir.exists() && !certDir.mkdirs()) {
                throw new IOException("Could not create certificate directory: " + certificatePath);
            }

            String safeUser = (userName == null ? "user" : userName).replaceAll("[^a-zA-Z0-9_-]", "_");
            String safeCourse = (courseName == null ? "course" : courseName).replaceAll("[^a-zA-Z0-9_-]", "_");
            String fileName = safeUser + "_" + safeCourse + "_Certificate.pdf";
            String filePath = certificatePath + fileName;

            Document document = new Document();
            PdfWriter.getInstance(document, new FileOutputStream(filePath));
            document.open();

            Font titleFont = new Font(Font.FontFamily.HELVETICA, 20, Font.BOLD);
            Font normalFont = new Font(Font.FontFamily.HELVETICA, 14);
            Font userFont = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD);
            Font dateFont = new Font(Font.FontFamily.HELVETICA, 12);

            document.add(new Paragraph("CERTIFICATE OF COMPLETION", titleFont));
            document.add(new Paragraph("This is to certify that", normalFont));
            document.add(new Paragraph(userName, userFont));
            document.add(new Paragraph("has successfully completed the " + courseName + " training.", normalFont));
            document.add(new Paragraph("Date: " + LocalDate.now(), dateFont));
            document.close();

            return filePath;
        } catch (DocumentException | IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
