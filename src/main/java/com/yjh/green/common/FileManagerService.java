package com.yjh.green.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {

    public static final String FILE_UPLOAD_PATH = "/home/ec2-user/green/images";

    //  public static final String FILE_UPLOAD_PATH = "C:\\허예진\\springProject\\green\\images";
	// 파일을 저장하고, 클라이언트에서 접근 가능한 주소를 만들어서 리턴하는 기능
	
    public static String saveFile(int userId, MultipartFile file) {
		
		// 파일 저장
		String fileUploadPath = "C:\\허예진\\springProject\\green\\images";
		// 사용자별로 폴더를 구분한다.
		// 사용자별로 폴더를 새로 만든다.
		// 폴더이름 : userId_현재시간
		// UNIX_TIME : 1970년 1월 1일 부터 흐른 시간(millisecond 1/1000)
		// C:\\허예진\\springProject\\upload\\images\\2_142485124\\asdf.png"
		
		String directoryName = "/" + userId + "_" + System.currentTimeMillis() + "/";
		
		// 디렉토리 생성
		String directoryPath = FILE_UPLOAD_PATH + directoryName;
		File directory = new File(directoryPath);
		if(directory.mkdir() == false) {
			// 디렉토리 생성 실패
			return null;
			
		}
		
		// 파일 저장
		try {
			byte[] bytes = file.getBytes();
		
			String filePath = directoryPath + file.getOriginalFilename();
			Path path = Paths.get(filePath);
			Files.write(path, bytes);
			
		} catch (IOException e) {
			
			e.printStackTrace();
			
			return null;
		}
		
		// 클라이언트에 접근 가능한 경로를 문자열로 리턴
		
		// http://localhost:8080/images/~
		// /images/2_38239823/test.png
		
		return "/images" + directoryName + file.getOriginalFilename();
		
		
	}
	
	// 파일 삭제 메소드
	public static boolean removeFile(String filePath) { // /images/2_1677137288573/couple-7061929_960_720.jpg
		// 삭제 경로 /images 를 제거하고
		// 실제 파일 저장 경로에 이어 붙여 준다.
		// C:\\허예진\\springProject\\upload\\images/2_1677137288573/couple-7061929_960_720.jpg
		
		String realFilePath = FILE_UPLOAD_PATH + filePath.replace("/images", "");
		Path path = Paths.get(realFilePath);
		
		// 파일이 존재하는지
		if(Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {

				e.printStackTrace();
				
				return false;
			}
		}
		
		// C:\\허예진\\springProject\\upload\\images/2_1677137288573
		// 디렉토리 경로
		Path dirPath = path.getParent();
		// 디렉토리 존재 하는지
		if(Files.exists(dirPath)) {
			try {
				Files.delete(dirPath);
			} catch (IOException e) {
				
				e.printStackTrace();
				
				return false;
			}
		}
		
		return true;
	}
}
