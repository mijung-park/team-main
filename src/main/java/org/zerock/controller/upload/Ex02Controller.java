package org.zerock.controller.upload;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import software.amazon.awssdk.auth.credentials.ProfileCredentialsProvider;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Controller
@RequestMapping("/uploadex02")
@Log4j
public class Ex02Controller {
   
   @RequestMapping("/sub01")
   public void method01(MultipartFile file) throws Exception {
      log.info(file.getOriginalFilename());
      
      String bucketName = "choongang-mezzang";
      String profileName = "spring1";
      S3Client s3 = S3Client.builder()
            .credentialsProvider(ProfileCredentialsProvider.create(profileName))
            .build();
      
      PutObjectRequest objectRequest = PutObjectRequest.builder()
            .bucket(bucketName)
            .key(file.getOriginalFilename())
            .contentType(file.getContentType())
            .acl(ObjectCannedACL.PUBLIC_READ)
            .build();
      
      s3.putObject(objectRequest, 
            RequestBody.fromInputStream(file.getInputStream(), file.getSize()));
   }
}