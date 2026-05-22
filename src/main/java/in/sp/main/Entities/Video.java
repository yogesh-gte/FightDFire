package in.sp.main.Entities;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import java.util.Date;

@Entity
@Table(name = "videos")
public class Video {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    
    @Enumerated(EnumType.STRING)
    private Category category;

    private String filePath; 
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "admin_id")
    private Admin uploadedBy; 

    private Long views = 0L;
    private Date uploadDate = new Date();

    public Video() {}

    public Video(String title, Category category, String filePath, Admin uploadedBy) {
        this.title = title;
        this.category = category;
        this.filePath = filePath;
        this.uploadedBy = uploadedBy;
        this.uploadDate = new Date();
        this.views = 0L;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public Category getCategory() { return category; }
    public void setCategory(Category category) { this.category = category; }
    public String getFilePath() { return filePath; }
    public void setFilePath(String filePath) { this.filePath = filePath; }
    public Admin getUploadedBy() { return uploadedBy; }
    public void setUploadedBy(Admin uploadedBy) { this.uploadedBy = uploadedBy; }
    public Long getViews() { return views; }
    public void setViews(Long views) { this.views = views; }
    public Date getUploadDate() { return uploadDate; }
    public void setUploadDate(Date uploadDate) { this.uploadDate = uploadDate; }
}
