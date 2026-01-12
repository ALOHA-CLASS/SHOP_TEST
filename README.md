# 쇼핑몰 프로젝트
ALOHA CLASS 더조은컴퓨터아카데미 - JSP 평가 - 쇼핑몰 초기 프로젝트

<a href="http://알클서버.com" target="_blank">사이트 바로가기 🔗 </a>

# Shopping (JDK17,21, Tomcat10.1)
<a href="https://wwwaloha.oopy.io/2e6e397e-5311-80f2-a396-c3b56d901d30" target="_blank">시험지 🔗 </a>


# Shop (JDK11, Tomcat8.5)
<details>
<summary>Shop</summary>
<div markdown="1">

## 주요 기능
### 회원
- 회원가입
- 로그인
  - 아이디 저장
  - 자동 로그인
- 마이 페이지
  - 회원정보 수정
  - 회원탈퇴
  - 주문 내역



### 상품
- 상품 정보
  - 상품 목록
  - 상품 조회
  - 상품 등록
  - 상품 수정
  - 상품 삭제
    
- 주문
  - 주문하기
  - 장바구니
  - 배송 정보 등록
  - 주문 정보 등록

<br><br><hr><br><br>

## 프로세스 구조도
### 쇼핑몰 프로젝트
<img src="https://i.imgur.com/tCdqDmw.png" id="쇼핑몰-프로젝트" />
<br><br><br><br>

### 회원
<img src="https://i.imgur.com/tCdqDmw.png" id="회원" />
<br><br><br><br>

### 상품
<img src="https://i.imgur.com/tCdqDmw.png" id="상품" />
<br><br><br><br>

<br><br><hr><br><br>



## 구현 화면
- 메인 화면 – index.jsp
- 로그인 – /user/login.jsp
- 회원가입 – /user/join.jsp
- 회원정보 수정 – /user/update.jsp
- 주문 내역 – /user/order.jsp (비회원)
- 주문 내역 – /user/order.jsp (회원)
- 로그인/가입/수정 완료 – /user/complete.jsp
- 상품 목록 – /shop/products.jsp
- 상품 정보 – /shop/product.jsp
- 상품 검색 – /shop/products.jsp
- 상품 편집 목록 – /shop/editProducts.jsp
- 상품 등록 – /shop/add.jsp
- 상품 수정 – /shop/update.jsp
- 장바구니 – /shop/cart.jsp
- 장바구니 – /shop/cart.jsp (장바구니 비었을 때)
- 배송정보 – /shop/ship.jsp
- 주문정보 – /shop/order.jsp
- 주문완료 – /shop/complete.jsp

<br><br><br><br>
<br><br><br><br>



### 메인 화면 – index.jsp
<img src="https://i.imgur.com/msW9aZ1.png" />
<br><br><br><br>
<br><br><br><br>

### 로그인 – /user/login.jsp
<img src="https://i.imgur.com/25lbO9z.png" />
<br><br><br><br>
<br><br><br><br>

### 회원가입 – /user/join.jsp
<img src="https://i.imgur.com/6X3PPZW.png" />
<br><br><br><br>
<br><br><br><br>

### 회원정보 수정 – /user/update.jsp
<img src="https://i.imgur.com/Un7W4U0.png" />
<br><br><br><br>
<br><br><br><br>

### 주문 내역 – /user/order.jsp (비회원)
<img src="https://i.imgur.com/a67jCHj.png" />
<br><br><br><br>
<br><br><br><br>

### 주문 내역 – /user/order.jsp (회원)
<img src="https://i.imgur.com/r8tj1pc.png" />
<br><br><br><br>
<br><br><br><br>

### 로그인/가입/수정 완료 – /user/complete.jsp
#### 가입완료
<img src="https://i.imgur.com/A1KdlB6.png" />
<br><br><br><br>

#### 로그인 완료
<img src="https://i.imgur.com/F4fm5AJ.png" />
<br><br><br><br>

#### 수정 완료
<img src="https://i.imgur.com/erZdZJc.png" />

#### 탈퇴 완료
<img src="https://i.imgur.com/n6UCxK8.png" />
<br><br><br><br>

<br><br><br><br>
<br><br><br><br>

### 상품 목록 – /shop/products.jsp
<img src="https://i.imgur.com/2dXGCil.png" />
<br><br><br><br>
<br><br><br><br>

### 상품 정보 – /shop/product.jsp
<img src="https://i.imgur.com/6NxXVgo.png" />
<br><br><br><br>
<br><br><br><br>

### 상품 검색 – /shop/products.jsp
<img src="https://i.imgur.com/fjITKAo.png" />
<br><br><br><br>
<br><br><br><br>

### 상품 편집 목록 – /shop/editProducts.jsp
<img src="https://i.imgur.com/QMheSi3.png" />
<br><br><br><br>
<br><br><br><br>

### 상품 등록 – /shop/add.jsp
<img src="https://i.imgur.com/3APGPBX.png" />
<br><br><br><br>
<br><br><br><br>

### 상품 수정 – /shop/update.jsp
<img src="https://i.imgur.com/V4t3eEI.png" />
<br><br><br><br>
<br><br><br><br>

### 장바구니 – /shop/cart.jsp
<img src="https://i.imgur.com/UruCwJr.png" />
<br><br><br><br>
<br><br><br><br>

### 장바구니 – /shop/cart.jsp (장바구니 비었을 때)
<img src="https://i.imgur.com/xpBqeNZ.png" />
<br><br><br><br>
<br><br><br><br>

### 배송정보 – /shop/ship.jsp
<img src="https://i.imgur.com/nlOnOXs.png" />
<br><br><br><br>
<br><br><br><br>

### 주문정보 – /shop/order.jsp 
<img src="https://i.imgur.com/ZBMStSa.png" />
<br><br><br><br>
<br><br><br><br>

### 주문완료 – /shop/complete.jsp
<img src="https://i.imgur.com/ca7TCQv.png" />
<br><br><br><br>
<br><br><br><br>










</div>
</details>
