<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>INDEX</title>
    <link rel="stylesheet" href="resources/css/header.css" />
    <link rel="stylesheet" href="resources/css/footer.css" />
    <link rel="stylesheet" href="resources/css/reset.css" />
    <script
      src="https://kit.fontawesome.com/f0a74bdf41.js"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://code.jquery.com/jquery-3.7.0.js"
      integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
      crossorigin="anonymous"
    ></script>
    <script type="text/javascript" src="headerFooter.js"></script>
  </head>
  <body>
    <div class="site-container">
      <div class="wrapper-without-footer">
        <header class="row header">
          <div class="header__wrapper">
            <div class="header__logo">
              <img
                class="header__logo--img"
                alt="RIFF몰"
                src="resources/img/logoWhite.png"
              />
            </div>
            <form class="header__form" onsubmit="return false;">
              <input class="header__input--text" autocomplete="off" />
              <button class="header__input--button">
                <i class="fa-solid fa-magnifying-glass"></i>
              </button>
            </form>

            <div>
              <button class="header__login"> 로그인 </button>
            </div>
            <div>
              <button class="header__signup" onclick= > 회원가입 </button>
            </div>
            <div>
              <button class="header__cart">장바구니</button>
            </div>
          </div>
        </header>

        <nav class="nav-header">
          <div>기타</div>
          <div>앰프</div>
          <div>이펙터</div>
          <div>주변용품</div>
          <div>게시판</div>
          <div>문의하기</div>
          <div>회사소개</div>
        </nav>
        <section class="row">
          <jsp:include page="${contentPage }"></jsp:include>
        </section>
      </div>
      <footer class="footer">
        <div class="footer__go-top">↑TOP</div>
        <div class="footer__info">
          <table>
            <tr>
              <td>상호</td>
              <td>(주)샤인뮤직넷</td>
            </tr>
            <tr>
              <td>대표</td>
              <td>정재환</td>
            </tr>
            <tr>
              <td>주소</td>
              <td>서울특별시 마포구 와우산로 173 지하1층</td>
            </tr>
            <tr>
              <td>사업자번호</td>
              <td>104-8159699</td>
            </tr>
            <tr>
              <td>통신판매업신고</td>
              <td>제 2006-04530호</td>
            </tr>
            <tr>
              <td>대표전화</td>
              <td>1600-7940</td>
            </tr>
            <tr>
              <td>FAX</td>
              <td>02.326-0932</td>
            </tr>
            <tr>
              <td colspan="2">
                COPYRIGHT(C) 2000~2014 SINEMUSICNET. ALL RIGHTS RESERVED.
              </td>
            </tr>
          </table>
        </div>
      </footer>
    </div>
  </body>
</html>
