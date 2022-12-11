### ![image](https://user-images.githubusercontent.com/81034311/206893445-66d0615c-63b7-4184-8203-222d25bf9d37.png)

---------------

### 목차

1. [엽AI사전 소개](#엽AI사전-소개)
2. [팀원 소개](#팀원-소개)
3. [기술 스택](#기술-스택)
4. [프로젝트 산출물](#프로젝트-산출물)
5. [활용 기술](#활용-기술)
6. [상세 기능](#상세-기능)

## 엽AI사전 소개

엽AI사전 색다른 기부 문화 조성을 위해 시도한 실험적인 프로젝트입니다.

최근 중요 소비 트렌드인 가치소비에 착안하여 사용자가 직접 자신만의 엽서를 제작하고 해당 엽서와 함께 기부까지 함께 진행할 수 있는 웹서비스입니다.  

구체적으로 엽AI사전은 웹에서 사용자가 스케치한 그림을 AI(GauGan2)를 활용해 실사화를 진행한 후 AI(Neural Style Algorithm)를 통해 화풍을 입혀 DIY 엽서를 제공합니다. 이렇게 직접 제작한 엽서나 검색을 통해 발견한 마음에 드는 엽서는 원하는 기부단체에 기부 시 사용합니다. 그리고 기부를 한 후 기부에 사용한 엽서들은 본인의 템플릿을 꾸미는 데 사용할 수 있게 되어 더 많은 기부로 이어지도록 설계했습니다.

--------

SSAFY 7기 2학기 특화 프로젝트
 2022.08.22 ~ 2022.10.07 **(7주)**

## 팀원 소개

| 팀원  | 역할           | 담당                                                     | 깃헙                             |
| --- | ------------ | ------------------------------------------------------ | ------------------------------ |
| 박정현 | 팀장, Frontend | 메인페이지, 엽서 생성 기능, UCC 편집, 중간 발표                         | https://github.com/kevin123488 |
| 민경대 | Backend      | API 설계 및 개발, CI/CD환경 구축, AI(Neural Style Algorithm) 적용 | https://github.com/rudwl1005a  |
| 박제학 | Frontend     | 시작 화면, 마이페이지, 전체 화면 디자인                                | https://github.com/jehaak      |
| 손지민 | Backend      | API 설계 및 개발, CI/CD환경 구축, AI(GauGan2)적용                 |                                |
| 전현우 | Frontend     | 로그인/회원가입 로직, 기부 기능, 검색 페이지, UCC 기획, 최종 발표              | https://github.com/soshot22    |

## 기술 스택

### BackEnd
1) Java (OpenJDK Zulu 8.33.0.1-win64)
2) Spring Boot Gradle 6.7
3) JupyterHup
4) Python 3.9.7

### FrontEnd
1) HTML5, CSS, JavaScript(ES6)
2) vuev 3.2.38
3) vue-router v4.1.5, vuex v4.0.2, axios v0.27.2, html2canvas v1.4.1

### DataBase
1) MySQL Workbench 8.0CE

### Server
1) AWS EC2 (MobaXterm)
2) Ubuntu 20.04 LTS
3) Docker 20.10.17v (server/client 동일)
4) jenkins

### 기타
1) AWS S3
2) IntelliJ 2022.1.3 (Ultimate Edition)
3) Visual Studio Code 1.70.0v

## 프로젝트 산출물

- ERD

![image](https://user-images.githubusercontent.com/81034311/206893507-47551649-7d81-4407-bb1a-36b63f899dcb.png)

- 서비스 아키텍처

![image](https://user-images.githubusercontent.com/81034311/206893512-860ef308-061c-495f-94ad-644d265c1bae.png)

- 포팅매뉴얼

## 활용 기술

#### [GauGan2](http://gaugan.org/gaugan2/)

**사용 예시**
![image](https://user-images.githubusercontent.com/81034311/206893525-f35cfde7-c4ff-4cd1-af7d-8e65ed2edebf.png)

#### [Neural Style Algorithm](https://github.com/jcjohnson/neural-style)

**사용 예시**

![image](https://user-images.githubusercontent.com/81034311/206893902-2ed41fef-2a2b-4fcf-ae9b-63692b691dec.png)


## 상세 기능

#### 시작화면

![StartPage](https://user-images.githubusercontent.com/81034311/206893625-9b2629a6-c766-4ca6-9fa0-c52c08768bc3.gif)

#### 로그인/회원가입

![Login,SignUp](https://user-images.githubusercontent.com/81034311/206893667-173b368d-269e-4f4b-893c-1c3e00fea87f.gif)

#### 메인 화면

![image](https://user-images.githubusercontent.com/81034311/206893682-e4dd74b8-a68a-4ce7-82eb-52bdaec7b193.png)
![image](https://user-images.githubusercontent.com/81034311/206893692-a75f7be1-5a55-42f4-9e01-7af00e1f7633.png)


#### 엽서 생성

1. 웹에서 스케치를 진행
![Drawing-min](https://user-images.githubusercontent.com/81034311/206893824-f7b7b9e7-ffdb-4965-b127-ac1d000860c3.gif)

2. 스케치한 그림에 적용할 화풍을 선택하고 변환 작업을 거쳐 실사화를 얻은 후 검색에 사용할 태그를 추가 후 엽서 등록
![CreatePostCard](https://user-images.githubusercontent.com/81034311/206893818-8e7d1f0c-fcf5-4651-af70-e39b7faeda2b.gif)

#### 기부 페이지

![Donation](https://user-images.githubusercontent.com/81034311/206893822-17bfed47-29c6-41f1-945b-33c704cd53c2.gif)

![image](https://user-images.githubusercontent.com/81034311/206893848-0407a52f-e23b-45a4-807b-a993fc2ff4bc.png)
![image](https://user-images.githubusercontent.com/81034311/206893869-064dbbb0-2c89-4155-a95a-6c1803644cb5.png)
![image](https://user-images.githubusercontent.com/81034311/206893875-d5044e2f-41a3-4e57-9b1b-b755a9682673.png)
![image](https://user-images.githubusercontent.com/81034311/206893881-6cdd28ed-0083-4a9e-b605-2978699baed1.png)
