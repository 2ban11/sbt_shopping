<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>INDEX</title>

<link rel="stylesheet" href="resources/css/header.css" />
<link rel="stylesheet" href="resources/css/footer.css" />
<link rel="stylesheet" href="resources/css/reset.css" />
<link rel="stylesheet" href="resources/css/kimoon/MainPage.css" />

<script src="https://kit.fontawesome.com/f0a74bdf41.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="resources/js/headerFooter.js"></script>

<script type="text/javascript" src="resources/js/myeonggyu/s_logout.js"></script>
<script type="text/javascript"
	src="resources/js/myeonggyu/kakaoLogIn.js"></script>
<script type="text/javascript"
	src="resources/js/myeonggyu/masterPage.js"></script>
<script type="text/javascript" src="resources/js/myeonggyu/login_chk.js"></script>
<script type="text/javascript" src="resources/js/kimoon/mainPage.js"></script>
</head>
<body>
	<div class="site-container">
		<div class="wrapper-without-footer">
			<!-- HEADER -->
			<header class="row-km header">
				<div class="header__wrapper">
					<div class="menu-hamberger">
						<i class="fa-solid fa-bars"></i>
					</div>
					<div class="header__logo">
						<a href="/shopping"> <img class="header__logo--img"
							alt="RIFF몰" src="resources/img/logoWhite.png" />
						</a>
					</div>
					<form action="search.do" class="header__form">
						<input name="search" class="header__input--text"
							autocomplete="off" />
						<button class="header__input--button">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</form>
					<button class="mobile-search--button">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
					<!-- 모바일 팝업 검색창 -->
					<div class="header-search-popup">
						<form action="search.do">
							<input class="header-popup__delete--input" type="search"
								name="search" placeholder="검색어를 입력해주세요" />
							<button class="header-popup__delete--btn"></button>
							<button class="header-popup__search--btn">검색</button>
							<button class="header-popup__close--btn" type="button">닫기</button>
						</form>
					</div>
					<div class="header__button">

						<c:choose>
							<c:when test="${not empty loginMember }">

								<div class="login_btn_container">
									<div class="header_logout_btn">
										<a href="/shopping/account.logout" class="logOut"><button>로그아웃</button></a>
									</div>
								</div>
								<div class="myPageBtn">
									<a class="header__signup" href="/shopping/mypage.order">
										<button>마이페이지</button>
									</a>
								</div>
								<a href="/shopping/mypage.order" onclick="checkLoginAndRedirect()">
								<button id="small_myPageBtn">
									<i class="fa-regular fa-user"></i>
								</button>
								</a>
								<div>
									<button class="header__cart"
										onclick="location.href='mypage.cart'">
										<i class="fa-solid fa-cart-shopping"></i>
									</button>
								

								</div>
							</c:when>
							<c:otherwise>
								<form action="/shopping/login.go">
									<div class="login_btn_container">
										<button class="header__login" onclick="/shopping/login.go">
											<span class="haader__login--text">로그인</span>
										</button>
									</div>
								</form>
								<a href="mypage.order">
									<button id="small_myPageBtn" onclick="checkLoginAndRedirect()">
										<i class="fa-regular fa-user"></i>
									</button>
								</a>
								<form action="/shopping/account.join.go">
									<div>
										<button class="header__signup">회원가입</button>
									</div>
								</form>
							</c:otherwise>
						</c:choose>
						<div>
							<c:if test="${loginMember.a_id eq 'master'}">
								<form action="adminPage" method="GET">
									<button class="header__signup" type="submit">관리자</button>
								</form>
							</c:if>
						</div>
					</div>
				</div>
			</header>
			<!-- //HEADER -->

			<!-- SIDEBAR -->
			<div class="sidebar__bg"></div>
			<div class="sidebar__menu">
				<ul class="sidebar__contents__wrap">
					<div class="sidebar__login-signup-wrapper">
						<div class="sidebar__login-signup--btn">
							<c:choose>
								<c:when test="${not empty loginMember }">
									<a href="/shopping/account.logout" class="logOut"><button>로그아웃</button></a>
									<form action="/mypage.order"></form>
								</c:when>

								<c:otherwise>
									<span class="sidebar__login"> <a
										href="/shopping/login.go">로그인</a>
									</span>
									<span class="sidebar__signup"><a
										href="/shopping/account.join.go">회원가입</a></span>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<li><a class="sidebar__item" href="#">기타</a>
						<ul class="sidebar__item-detail">
							<li>일렉기타</li>
							<li>어쿠스틱</li>
							<li>클래식</li>
							<li>베이스</li>
							<li>우쿠렐레</li>
						</ul></li>
					<li><a class="sidebar__item" href="#">앰프</a>
						<ul class="sidebar__item-detail">
							<li>일렉기타</li>
							<li>어쿠스틱</li>
							<li>베이스</li>
						</ul></li>
					<li><a class="sidebar__item" href="#">이펙터</a>
						<ul class="sidebar__item-detail">
							<li>일렉기타</li>
							<li>어쿠스틱</li>
							<li>클래식</li>
							<li>베이스</li>
							<li>멀티</li>
						</ul></li>
					<li><a class="sidebar__item" href="#">주변용품</a>
						<ul class="sidebar__item-detail">
							<li>기타줄</li>
							<li>피크</li>
							<li>케이블</li>
							<li>카포</li>
						</ul></li>
					<li><a class="sidebar__item" href="#">게시판</a>
						<ul class="sidebar__item-detail">
							<li><a href="go.board?type=1">공지</a></li>
							<li><a href="go.board?type=2">자유</a></li>
							<li><a href="go.board?type=3">개인레슨</a></li>
							<li><a href="go.board?type=4">구인</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- //SIDEBAR -->

			<!-- MAIN NAVIGATION -->
			<nav class="nav-header">
				<div class="nav-item">
					기타<em class="caret"></em>
					<div class="nav-item-sub jh">
						<ul>
							<li><a href="guitarPage?BC=기타&MC=일렉기타">일렉기타</a></li>
							<li><a href="guitarPage?BC=기타&MC=어쿠스틱기타">어쿠스틱</a></li>
							<li><a href="guitarPage?BC=기타&MC=클래식기타">클래식</a></li>
							<li><a href="guitarPage?BC=기타&MC=베이스기타">베이스</a></li>
							<li><a href="guitarPage?BC=기타&MC=우쿠렐레기타">우쿠렐레</a></li>
						</ul>
					</div>
				</div>
				<div class="nav-item">
					앰프<em class="caret"></em>
					<div class="nav-item-sub jh">
						<ul>
							<li><a href="ampPage?BC=앰프&MC=기타앰프">기타앰프</a></li>
							<li><a href="ampPage?BC=앰프&MC=어쿠스틱기타">어쿠스틱</a></li>
							<li><a href="ampPage?BC=앰프&MC=베이스기타">베이스</a></li>
						</ul>
					</div>
				</div>
				<div class="nav-item">
					이펙터<em class="caret"></em>
					<div class="nav-item-sub jh">
						<ul>
							<li><a href="effectorPage?BC=이펙터&MC=일렉기타">일렉기타</a></li>
							<li><a href="effectorPage?BC=이펙터&MC=어쿠스틱기타">어쿠스틱</a></li>
							<li><a href="effectorPage?BC=이펙터&MC=클래식기타">클래식</a></li>
							<li><a href="effectorPage?BC=이펙터&MC=베이스기타">베이스</a></li>
							<li><a href="effectorPage?BC=이펙터&MC=멀티이펙터">멀티</a></li>
						</ul>
					</div>
				</div>
				<div class="nav-item">
					주변용품<em class="caret"></em>
					<div class="nav-item-sub jh">
						<ul>
							<li><a href="accessoryPage?BC=주변용품&MC=기타줄">기타줄</a></li>
							<li><a href="accessoryPage?BC=주변용품&MC=피크">피크</a></li>
							<li><a href="accessoryPage?BC=주변용품&MC=케이블">케이블</a></li>
							<li><a href="accessoryPage?BC=주변용품&MC=카포">카포</a></li>
						</ul>
					</div>
				</div>
				<div class="nav-item">
					게시판<em class="caret"></em>
					<div class="nav-item-sub">
						<ul>
							<li><a href="go.board?type=1">공지</a></li>
							<li><a href="go.board?type=2">자유</a></li>
							<li><a href="go.board?type=3">개인레슨</a></li>
							<li><a href="go.board?type=4">구인</a></li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- //MAIN NAVIGATION -->

			<!-- CONTENTS -->
			<section class="row-km">

				<jsp:include page="${contentPage }"></jsp:include>
			</section>
		</div>
		<!-- //CONTENTS -->

		<!-- FOOTER -->
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
						<td>홍길동</td>
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
						<td colspan="2">COPYRIGHT(C) 2000~2014 SINEMUSICNET. ALL
							RIGHTS RESERVED.</td>
					</tr>
				</table>
			</div>

		</footer>
		<!-- //FOOTER -->
	</div>

</body>
</html>
