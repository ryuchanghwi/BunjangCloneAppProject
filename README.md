# BunjangCloneAppProject
# '번개장터' 앱을 서버와 협업하여 2주간 클론코딩한 프로젝트입니다.

## 주요기능 
### 1. 회원가입, 로그인 기능
<img src= "https://user-images.githubusercontent.com/78063938/149719516-a0b11a7d-0693-4f03-9ab5-fb190b4244b5.png" width="250">

- POST Method를 사용하여 이메일, 패스워드, 스토어네임을 통해 회원가입을 진행합니다.
- TweeTextField 라이브러리를 활용하여 TextField를 구성하였습니다.
- TextField의 내용이 채워지지 않으면 에러 알림이 나타나도록 하였습니다
- 회원가입에 실패할 경우 에러 알림이 나타나도록 하였습니다. 

<img src= "https://user-images.githubusercontent.com/78063938/149720426-5d5a4994-561f-4f09-a2bc-519cf98f26c3.png" width="250">

- POST Method를 사용하여 이메일, 패스워드를 입력하면 로그인이 완로됩니다.
- TweeTextField 라이브러리를 활용하여 TextField를 구성하였습니다.
- TextField의 내용이 채워지지 않으면 에러 알림이 나타나도록 하였습니다.
- 로그인에 실패할 경우 에러 알림이 나타나도록 하였습니다. 


### 2. 전체 상품 조회

<img src= "https://user-images.githubusercontent.com/78063938/149718856-3e46964d-d1a0-4a7a-9afd-34eba82f89c9.png" width="250">

- GET Method를 사용하여 전체 상품 리스트를 CollectionView에 나타냈습니다.
- Kingfisher 라이브러리를 활용하여 URL 주소를 가지고 있는 이미지를 앱 내에 보여지게 하였습니다.

### 3. 상품 상세 정보

<img src= "https://user-images.githubusercontent.com/78063938/149721120-48ce3e5e-9b83-4857-bcb0-8c62415a2ff4.png" width="250">
<img src= "https://user-images.githubusercontent.com/78063938/149722071-23532abe-370f-4895-97b3-4b6f2b6af16f.png" width="250">

- GET Method를 사용하여 선택한 상품의 상세정보를 나타냈습니다.
- Kingfisher 라이브러리를 활용하여 URL 주소들을 CollectionView에 나타내 스크롤할 수 있도록 하였습니다.
- Safari Servies 프레임워크를 추가하여 외부 링크로 이동할 수 있도록 하였습니다. 

### 4. 상품 구매 


<img src= "https://user-images.githubusercontent.com/78063938/149722237-b1a79c4a-78a6-4edb-bfdc-c4aa077776d4.png" width="250">
<img src= "https://user-images.githubusercontent.com/78063938/149722260-7998e221-86bb-4739-9b2b-96416cb54951.png" width="250">

- POST Method를 사용하여 선택한 상품을 구매할 수 있도록 하였습니다. 
- 이용약관을 선택하지 않으면 구매가 되지 않도록 하였습니다. 

### 5. 상품 등록

<img src= "https://user-images.githubusercontent.com/78063938/149724918-d2d6bc8f-c0c3-4f35-8883-7d8e4cf8132d.png" width="250">
<img src= "https://user-images.githubusercontent.com/78063938/149724940-ae10e487-f404-46a9-a5c9-417c3f251b07.png" width="250">

- POST Method를 사용하여 판매하고자 하는 상품을 등록하도록 하였습니다.
- 입력란을 Delegation을 활용하여 데이터를 전달하였습니다.
- '네이버 지역 검색 API'를 활용하여 지역을 검색할 수 있도록 하였습니다.

### 6. 프로필 조회 및 수정

<img src= "https://user-images.githubusercontent.com/78063938/149725865-f9ae9366-3700-441b-8ab1-0069cb2ca8a2.png" width="250">

- GET Method를 사용하여 이용자의 상점 정보를 보여주었습니다.
- PATCH Method를 사용하여 이용자의 상점 정보를 수정할 수 있도록 하였습니다. 
- Delegation을 활용하여 데이터를 전달할 수 있도록 하였습니다. 

### 7. 배송지 관리(등록 및 조회)

<img src= "https://user-images.githubusercontent.com/78063938/149727115-e752d4f7-4d9e-4bcc-a31b-5feaa8ac5357.png" width="250">
<img src= "https://user-images.githubusercontent.com/78063938/149725360-08ac22e9-caea-45ef-b5ff-dd63e860d65a.png" width="250">
<img src= "https://user-images.githubusercontent.com/78063938/149727262-06d750c3-1bba-4c4f-b950-bf7c322a5893.png" width="250">

- POST Method를 사용하여 이용자의 주소를 입력할 수 있도록 하였습니다. 
- GET Method를 사용하여 이용자가 등록한 주소를 TableView에 조회할 수 있도록 하였습니다.
- Delegation을 활용하여 데이터를 전달할 수 있도록 하였습니다. 



### 8. 하위 범주 상품 조회

<img src= "https://user-images.githubusercontent.com/78063938/149727566-01c0fc80-4860-4526-81c0-ea51f2a9f5b7.png" width="250">
<img src= "https://user-images.githubusercontent.com/78063938/149727575-20a10bcb-f19c-4c3f-a8a5-d6b57dd79427.png" width="250">

- 카테고리 인덱스로 상품들을 분류하여 카테고리 별로 상품을 조회할 수 있게 하였습니다.
- GET Method를 사용하여 카테고리 별로 상품을 조회할 수 있도록 하였습니다. 

