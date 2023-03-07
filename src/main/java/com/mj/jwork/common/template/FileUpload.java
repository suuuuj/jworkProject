package com.mj.jwork.common.template;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public class FileUpload {

	public static String saveFile(MultipartFile upfile, HttpSession session, String folderPath) {
		
		// 파일명 수정작업 후 서버에 업로드(수정명 : "20230223122130XXXXX.png" 날짜+시분초+랜덤값다섯자리.확장자)
		String originName = upfile.getOriginalFilename();
		
		String currentTime= new SimpleDateFormat("yyyyMMddHHmmSS").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000 );
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		// 업로드 시키고자 하는 폴더의 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath(folderPath);
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return folderPath + changeName; //"resources/XXXXXX/XXXXXXX.peng"
		
	}
	
	
}
