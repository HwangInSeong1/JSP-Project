### JSP-Project 
```
본 프로젝트는 JSP 응용 프로그래밍 기말 프로젝트 겸 만든 웹사이트입니다. 
```

### 홈페이지 요구사항
![캡처1](https://user-images.githubusercontent.com/66094508/132645285-2700c2df-f4e6-4c34-82b2-fe0d2d0c5058.PNG)
![캡처2](https://user-images.githubusercontent.com/66094508/132645489-507f10a7-7455-4a14-acd1-cb01438d3dcb.PNG)

### 프로젝트 구현화면1
```
메인화면 구현화면입니다.
네비게이션 메뉴바는 마우스를 호버하면 서브메뉴바가 나타나도록 구현했습니다.

*저작권문제가 있을수있어 영화포스터는 가렸습니다.
```
![1](https://user-images.githubusercontent.com/66094508/132646450-aa43ad15-d9db-4f8b-a04b-b04ec29eed3e.png)
![2](https://user-images.githubusercontent.com/66094508/132646458-e74c0eb8-6a50-402a-99cb-3440bf92250b.png)

### 프로젝트 구현화면2
```
회원가입 창과 그에 해당하는 회원DB 구조입니다.
```
![그림2](https://user-images.githubusercontent.com/66094508/132647077-39b5639d-d471-4b12-8ba8-14033e3f4bc6.png)
![그림1](https://user-images.githubusercontent.com/66094508/132647086-c65f86e0-6c19-4649-894b-46fcef631d0f.png)

### 프로젝트 구현화면3
```
회원자가 게시판 글을 쓰게되면 해당게시판DB에 저장되고 그에따른 게시판 목록이 최신화 되도록 하였습니다.
또한 영화별로 리뷰게시글을 볼수 있도록 select-option 기능을 추가하였습니다.
```
![그림8](https://user-images.githubusercontent.com/66094508/132647508-9acee6cc-06b8-4a68-8f34-f8ccb856d38e.png)
![그림7](https://user-images.githubusercontent.com/66094508/132647547-4d2a2994-6399-43da-b814-b1e18c32f6c1.png)
![그림6](https://user-images.githubusercontent.com/66094508/132647574-72fa52da-2bda-4a3d-b32f-799ff9389a4f.png)

### 그밖의 기능구현
```
회원들의 각 영화별 부여한 점수별로 평균을 매겨 실시간으로 영화 순위가 바뀌는 기능을 구현했습니다.
```
![그림4](https://user-images.githubusercontent.com/66094508/132648089-1d917305-edfe-4705-b5fb-cc7125e9be9b.png)

### Code 설명
```
// UserDAO.java 파일 MYSQL DB TABLE 연결 
public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/movie?serverTimezone=UTC";
			String dbID = "root";
			String dbPW = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPW);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
```
