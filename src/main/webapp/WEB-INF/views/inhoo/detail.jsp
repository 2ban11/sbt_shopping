<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파이널</title>



<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
<script src="resources/js/modal.js"></script>
<script type="text/javascript">
	$(function () {
		$("#jsonBtn").click(function(){
			let start = $("#start").val();
			let end = $("#end").val();
			console.log(start);
			console.log(end);
			
			$.getJSON("review.search?start="+start+"&end="+end, function(j) {
				$('#table1').empty();
			    console.log(j);
			    console.log(JSON.stringify(j));
			    $.each(j.reviews, function(i, r){
			    	console.log(r)
			    	
			    	
			    let th1 = $("<th></th>").text(r.r_rate);
			    let th2 = $("<th></th>").text(r.r_id);
			    let th3 = $("<th></th>").text(r.r_content);
			    let th4 = $("<th></th>").text(r.r_date);
			    
			    let tr = $("<tr></tr>").append(th1,th2,th3,th4);
			    	$("#table1").append(tr);
			    })
			    
			})
			
		});
		
		
	})
</script>
    
</head>
<body>
<div class="t3-wrapper">
      <!-- Main Content -->
      <div id="t3-mainbody" class="wrap t3-mainbody" style="margin-top: 20px">
        <div class="container">
          <div class="row equal-height">
            <div id="t3-content" class="t3-content col-md-12">
              <!-- <div id="system-message-container"></div> -->
              <div class="productdetail-view productdetails">
                <div class="page-header">
                  <!-- <div style="display:block;border:1px solid rgba(255,255,255,0.1);padding-left:10px;padding-right:10px;"> -->
                  <img src="img폴더/ha.jpeg" width="80" />
                  <!-- </div> -->
                  <div
                    style="
                      clear: both;
                      position: absolute;
                      margin-top: 18px;
                      z-index: 10;
                      text-align: center;
                    "
                  ></div>
                  <h1
                    style="
                      font-size: 20px;
                      padding-left: 110px;
                      display: inline-block;
                      text-transform: initial;
                    "
                  >
                    <span>[특전제공] 용과 같이7 외전 이름을 지운 자</span>
                    <br />
                    <span style="text-transform: none">
                      Like a Dragon Gaiden: The man Who Erased His Name
                    </span>
                  </h1>
                </div>


              
                <div class="row align-items-start">
                  <div class="left col-md-7 col-sm-12">
                    <div class="slide">
                      <div
                        id="custCarousel"
                        class="carousel slide"
                        data-ride="carousel"
                        align="center"
                      >
                        <!-- slides -->
                        <div class="carousel-inner">
                          <div class="carousel-item active">
                            <img src="img폴더/ha.jpeg" alt="Hills" />
                          </div>

                          <div class="carousel-item">
                            <img src="img폴더/hul.jpeg" alt="Hills" />
                          </div>

                          <div class="carousel-item">
                            <img src="img폴더/hul.jpeg" alt="Hills" />
                          </div>

                          <div class="carousel-item">
                            <img src="img폴더/kkacdugi.jpeg" alt="Hills" />
                          </div>
                        </div>

                        <!-- Left right -->
                        <a
                          class="carousel-control-prev"
                          href="#custCarousel"
                          data-slide="prev"
                        >
                          <span class="carousel-control-prev-icon"></span>
                        </a>
                        <a
                          class="carousel-control-next"
                          href="#custCarousel"
                          data-slide="next"
                        >
                          <span class="carousel-control-next-icon"></span>
                        </a>
                      </div>
                    </div>

                    <div class="clear"></div>

                    <div class="vm-productdetail-tabs-container">
                      <ul class="nav nav-tabs" style="margin-bottom: 8px">
                        <li class="active">
                          <a href="#goods_info3" data-toggle="tab">게임정보</a>
                        </li>
                        <li>
                          <a href="#goods_info5" data-toggle="tab"
                            >시스템 요구사항</a
                          >
                        </li>
                      </ul>
                      <div id="myTabContent" class="tab-content">
                        <div id="goods_info2" class="tab-pane fade">
                          <div class="product-description">
                            <p><br /></p>
                          </div>
                        </div>
                        <div id="goods_info3" class="tab-pane fade active in">
                          <div class="product-description"></div>
                          <div class="product-description">
                            <p>
                              <b style="color: rgb(255, 170, 0)"
                                >※ 예약 특전은 한정 수량으로 조기 품절될 수
                                있습니다.<br />※ 제품 코드(키) 발송은 추가
                                공지사항을 통해 안내해 드릴 예정입니다.<br /><br /><br /></b
                              ><span style="color: rgb(40, 180, 243)"
                                ><b>■ 예약 구매 특전</b></span
                              ><br /><b>레전더리 파이터 팩</b><br />사람들의
                              눈길을 피하듯 바다 위에 떠 있는 정체불명의
                              컨테이너선.<br />그 선박 내부의 투기장에 동성회
                              전설의 야쿠자 3명이 참전!<br />최강자는 누구인가?
                              전설이라 불린 사나이들의 뜨거운 싸움을 놓치지
                              마라!<br /><br />추가 캐릭터 「마지마 고로」<br />추가
                              캐릭터 「사에지마 타이가」<br />추가 캐릭터
                              「도지마 다이고」<br /><br /><br /><b
                                ><span style="color: rgb(255, 170, 0)"
                                  >※ 2023년 11월 8일 23:59 (JST)까지 예약하시면
                                  본 특전을 획득할 수 있습니다. 또한, 예약 기간
                                  종료 후에 본 특전은 유료로 판매될
                                  예정입니다.</span
                                ></b
                              ><br /><b
                                ><span style="color: rgb(255, 170, 0)"
                                  >※ 본 콘텐츠를 이용하시려면 별도 판매하는
                                  『용과 같이7 외전 이름을 지운 자』 본편이
                                  필요합니다. 또한, 최신판 패치 적용이 필요할
                                  경우에는 업데이트 후에 이용해 주십시오.</span
                                ></b
                              ><br />&nbsp;
                            </p>
                            <hr />
                            <p>
                              <br /><b
                                ><span style="color: rgb(40, 180, 243)"
                                  >코드 네임 「죠류」.</span
                                ></b
                              ><br />일찍이 전설의 야쿠자라 불린 남자, 키류
                              카즈마는 사랑하는 가족을 지키기 위해 자신의
                              이름마저 버리고 어둠에 묻혀 살고 있었다…<br />키류
                              카즈마의 시점에서 『용과 같이6 생명의 시』 이후의
                              공백기를 그린 완전 신작.<br /><br />진화한 배틀
                              액션과 새로운 시스템은 물론, 몰입 요소가 가득한
                              플레이 스폿도 건재.<br />호화 배우진이 연기하는
                              매력적인 신 캐릭터에도 주목.<br /><br /><b
                                >■ 키류 카즈마의 시점에서 그려지는 공백기의
                                이야기</b
                              ><br />사랑하는 가족을 지키기 위해 자신의 죽음을
                              위장하고, 모든 것을 버린 전설의 야쿠자 키류
                              카즈마.<br />그러나 그 비밀을 알아낸 정체불명의
                              그림자가 다가오는데……<br />지금까지 그려지지
                              않았던 『용과 같이6 생명의 시』 이후의 공백기,
                              그리고 『용과 같이7 빛과 어둠의 행방』의 이면을
                              키류 카즈마의 시점에서 그린 완전 신작.<br /><br /><b
                                >■ 2종류의 스타일로 싸우는 진화한 배틀 액션</b
                              ><br />배틀에서는 「응룡」과 「에이전트」라는
                              2종류의 새로운 스타일을 바꿔가며 플레이 가능.<br />본
                              시리즈가 자랑하는 화려하고 호쾌한 야쿠자 액션을
                              진화시킨 「응룡」.<br /><br /><img
                                src="https://cdn.cloudflare.steamstatic.com/steam/apps/2375550/extras/Ultimate_Combat_2.gif?t=1686260306"
                              /><br /><br />동서고금의 격투술을 바탕으로 바인드
                              와이어 등의 전용 도구를 활용하며, 신속하게 적을
                              제압하는 「에이전트」.<br />파워로 압도할 것인가,
                              스피드로 제압할 것인가. 상황에 맞게 2종류의
                              스타일을 구사하며 적을 쓰러트려라!<br /><br /><b
                                >■ 몰입 요소 가득한 충실한 플레이 스폿</b
                              ><br /><br /><img
                                src="https://cdn.cloudflare.steamstatic.com/steam/apps/2375550/extras/Endless_Entertainment.gif?t=1686260306"
                              /><br /><br />「용과 같이」 시리즈가 자랑하는
                              다채로운 플레이 스폿은 본 타이틀에서도 건재.<br />수많은
                              강적이 앞길을 가로막는 「투기장」이나 실사
                              영상으로 궁극의 현장감을 맛볼 수 있는 「캬바클럽」
                              외에도 「가라오케」, 「포켓 서킷」, 「다트」 등
                              인기의 플레이 스폿이 대폭 파워 업하여 수록. 자신의
                              욕망이 이끄는 대로 마음껏 즐겨보자!<br />
                            </p>
                          </div>
                        </div>
                        <div id="goods_info4" class="tab-pane fade">
                          <div class="product-description">
                            <p><br /></p>
                          </div>
                        </div>
                        <div id="goods_info5" class="tab-pane fade">
                          <div class="product-description">
                            <p>
                              <b>최소:</b><br />운영체제: Windows 10 1903(OS
                              Build 18362)<br />프로세서: Intel Core i5-3470,
                              3.2 GHz or AMD Ryzen 3 1200, 3.1 GHz<br />메모리:
                              8 GB RAM<br />그래픽: NVIDIA GeForce GTX 960, 2 GB
                              or AMD Radeon RX 460, 2 GB or Intel Arc A380, 6
                              GB<br />DirectX: 버전 12<br />사운드카드: Windows
                              Compatible Audio Device<br />추가 사항: 1080p Low
                              @ 30 FPS w/ Balanced FSR 1.0, requires a CPU which
                              supports the AVX and SSE4.2 instruction set<br /><br /><b
                                >권장:</b
                              ><br />운영체제: Windows 10 1903 (OS Build
                              18362)<br />프로세서: Intel Core i7-4790, 3.6 GHz
                              or AMD Ryzen 5 1600, 3.2 GHz<br />메모리: 8 GB
                              RAM<br />그래픽: NVIDIA GeForce RTX 2060, 6 GB or
                              AMD Radeon RX Vega 56, 8 GB or Intel Arc A750, 8
                              GB<br />DirectX: 버전 12<br />사운드카드: Windows
                              Compatible Audio Device<br />추가 사항: 1080p High
                              @ 60 FPS w/o FSR, requires a CPU which supports
                              the AVX and SSE4.2 instruction set<br />&nbsp;
                            </p>
                            <hr />
                            <br />© SEGA<br />
                            <br />
                            <p>
                              ※ 시스템 요구 사항은 출시 버전을 기준으로 하며,
                              컨텐츠 추가와 업데이트로 인한 변경 사항이 있을 수
                              있습니다.
                            </p>
                          </div>
                        </div>
                        <div id="goods_info8" class="tab-pane fade">
                          <div class="product-description">
                            <p><br /></p>
                          </div>
                        </div>
                        <div id="goods_event" class="tab-pane fade">
                          <div class="product-description">
                            <p><br /></p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>




                 
                  <div class="right row justify-content-center col-md-3 col-sm-12">
                    <div class="vm-product-details-container">
                      <div class="t3-module border p-3">
                        <div id="goods_img">
                          <img
                            src="https://image.directg.net/upload/product/goods_1686554476_bimg.jpg"
                            width="320"
                            height="150"
                            title="[특전제공] 용과 같이7 외전 이름을 지운 자"
                            onerror="this.src='/images/404.jpg'"
                          />
                        </div>
                        <div class="module-inner">
                          <div class="module-ct">
                            <div class="vmgroup single-product normal-module">
                              <div class="vmproduct normal-module">
                                <div class="spacer">
                                  <div
                                    id="goods_info1"
                                    style="
                                      color: #d43f3a;
                                      line-height: 140%;
                                      font-weight: bold;
                                    "
                                  >
                                    <span
                                      
                                      style="
                                        clear: both;
                                        font-weight: bolder;
                                        font-size: 14px;
                                      "
                                      >■ 심의 예정 상품입니다. 대한민국 외
                                      국가에서는 제품 코드(키) 등록이
                                      불가합니다. 플랫폼의 국가 설정을 확인해
                                      주시기 바랍니다.</span
                                    >
                                  </div>

                                  <div class="product-short-description"></div>

                                  <div
                                    class="product-price salesprice"
                                    id="productPrice8"
                                    style="padding-top: 10px"
                                  >
                                    <div
                                      class="PricebasePrice vm-display vm-price-value"
                                    >
                                      <span class="vm-price-desc">정상가 </span>
                                      <span
                                        class="PricebasePrice"
                                        style="
                                          font-weight: normal;
                                          font-size: 13px;
                                        "
                                        >49,800 원</span
                                      >
                                    </div>
                                    <span class="price-crossed"></span>
                                    <div
                                      class="PricesalesPrice vm-display vm-price-value"
                                    >
                                      <span class="vm-price-desc">판매가 </span>
                                      <span
                                        class="PricesalesPrice"
                                        style="color: #f0ad4e"
                                        >45,000</span
                                      >
                                      <span>원</span>
                                    </div>
                                  </div>

                                  <div class="product-info">
                                    <div class="vm-display">
                                      <span class="vm-desc">지원모드 </span>
                                      <span class="vm-value">싱글 플레이</span>
                                    </div>
                                    <div class="vm-display release_date">
                                      <span class="vm-desc">출시일 </span>
                                      <span class="vm-value"> 2023-11-09 </span>
                                    </div>
                                    <div class="vm-display">
                                      <span class="vm-desc">장르 </span>
                                      <span class="vm-value">액션</span>
                                    </div>
                                    <div class="vm-display">
                                      <span class="vm-desc">퍼블리셔 </span>
                                      <span class="vm-value"
                                        ><a
                                          href="game_thumb.html?search_publisher=93"
                                          >SEGA</a
                                        ></span
                                      >
                                    </div>
                                    <div class="vm-display">
                                      <span class="vm-desc">개발사 </span>
                                      <span class="vm-value"
                                        >Ryu Ga Gotoku Studio</span
                                      >
                                    </div>
                                    <div class="vm-display">
                                      <span class="vm-desc">플랫폼 </span>
                                      <span class="vm-value">Steam</span>
                                    </div>
                                    <div class="vm-display">
                                      <span class="vm-desc">언어 </span>
                                      <span class="vm-value">한국어</span>
                                    </div>
                                    <div class="vm-display">
                                      <span class="vm-desc">게임패드 </span>
                                      <span class="vm-value">지원함</span>
                                    </div>
                                    
                                  </div>
                                  <div
                                    class="vmproduct-link"
                                    style="text-align: center"
                                  >
                                    <button
                                      type="button"
                                      class="btn btn-warning btn-lg"
                                      id="btn_cart"
                                      data="50004203"
                                      data-assetid="3508"
                                      data-prodtp="1"
                                    >
                                      장바구니
                                    </button>
                                    <button
                                      type="button"
                                      class="btn btn-default btn-lg"
                                      id="btn_wishlist"
                                      data="50004203"
                                    >
                                      위시리스트
                                    </button>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="clear"></div>

                    <div class="product-share-container">
                      <div class="docs-section">
                        <div class="page-header">
                          <h2 style="font-size: 16px; text-indent: 20px">
                            공유하기
                          </h2>
                        </div>
                        <div class="row">
                          <div class="col-md-12">
                            <div class="input-inline">
                              <button
                                type="button"
                                class="btn"
                                id="btn_facebook"
                                style="
                                  background: #4e69a2;
                                  color: #ffffff;
                                  font-size: 13px;
                                "
                              >
                                <i
                                  class="fa fa-facebook"
                                  style="background: #4e69a2; color: #ffffff"
                                ></i>
                                페이스북
                              </button>
                              <button
                                type="button"
                                class="btn"
                                id="btn_twitter"
                                style="
                                  background: #319de1;
                                  color: #ffffff;
                                  font-size: 13px;
                                "
                              >
                                <i
                                  class="fa fa-twitter"
                                  style="background: #319de1; color: #ffffff"
                                ></i>
                                트위터
                              </button>
                              <!--<button type="button" class="btn" id="btn_google" style="background:#df513f;color:#ffffff;font-size:13px"><i class="fa fa-google-plus" style="background:#df513f;color:#ffffff"></i> 구글+</button>-->
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>







                </div>


                <div class="row justify-content-between mt-5">
                  <div class="col-5 mb-3">
                    <h2>구매 후기</h2>
                    <input id="start" name="start">
                    <input id="end" name="end">
                    <button id="jsonBtn"> 내용보기</button>
                    <button onclick="location.href='detail.reviews.json'">구매후기 보기 </button>
                  
                  </div>
                  <div class="col-1">
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModalCenter">
                      후기 사용
                    </button>
                  </div>
                </div>
  
  
  
  
                <div class="row justify-content-center mt-3">
                  <div class="col-12">
                    <table id="table1" class="table table-dark">
                      <thead>
                        <tr>
                          <th scope="col">별점</th>
                          <th scope="col">닉네임</th>
                          <th scope="col">내용</th>
                          <th scope="col">작성일</th>
                        </tr>
                      </thead>
                      <!-- <tbody>
                        <tr>
                          <th scope="row">1</th>
                          <td>Mark</td>
                          <td>Otto</td>
                          <td>@mdo</td>
                        </tr>
                        <tr>
                          <th scope="row">2</th>
                          <td>Jacob</td>
                          <td>Thornton</td>
                          <td>@fat</td>
                        </tr>
                        <tr>
                          <th scope="row">3</th>
                          <td>Larry</td>
                          <td>the Bird</td>
                          <td>@twitter</td>
                        </tr>
                      </tbody> -->
                    </table>
                  </div>
                </div>
  
  
               <div class="row justify-content-center">
                  <div class="col-auto">
                    <nav aria-label="...">
                      <ul class="pagination pagination-sm">
                        <li class="page-item disabled">
                          <a class="page-link" href="#" tabindex="-1">1</a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                      </ul>
                    </nav>
                  </div>
               </div>



              <div class="row justify-content-between mt-5">
                <div class="col-5 mb-3">
                  <h2>Q&A</h2>
                </div>
                <div class="col-1">
                  <button type="button" class="btn btn-danger">상품문의</button>
                </div>
              </div>




              <div class="row justify-content-center mt-3">
                <div class="col-12">
                  <table class="table table-dark" id="table1">
                    <thead>
                      <tr>
                        <th scope="col">별점</th>
                        <th scope="col">닉네임</th>
                        <th scope="col">내용</th>
                        <th scope="col">작성일</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                      </tr>
                      <tr>
                        <th scope="row">2</th>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td>@fat</td>
                      </tr>
                      <tr>
                        <th scope="row">3</th>
                        <td>Larry</td>
                        <td>the Bird</td>
                        <td>@twitter</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>


             <div class="row justify-content-center">
                <div class="col-auto">
                  <nav aria-label="...">
                    <ul class="pagination pagination-sm">
                      <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1">1</a>
                      </li>
                      <li class="page-item"><a class="page-link" href="#">2</a></li>
                      <li class="page-item"><a class="page-link" href="#">3</a></li>
                    </ul>
                  </nav>
                </div>
             </div>

             
            




              


              </div>
            </div>
          </div>
        </div>
      </div>
    </div>


 


<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">후기 작성</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <!-- 리뷰 작성 양식  -->
         <form action="regReviewDo" method="post">
      <div class="modal-body">
          <div class="table-responsive">
            <table class="table table-striped">
              <tbody>
                <tr>
                  <td><input type="text" class="form-control"
                    placeholder="이름" name="r_id"></td>
                </tr>
                <tr>
                  <td><input type="text" class="form-control"
                    placeholder="제목" name="r_title" maxlength="20"></td>
                </tr>
                <tr>
                  <td><textarea class="form-control" placeholder="리뷰 내용"
                      name="r_content" maxlength="200" style="height: 350px;"></textarea>
                  </td>
                </tr>
                <tr>
                  <td>
                    <div class="rating">
                    <!-- <input type="hidden" id ="r_contentsId" name="r_contentsId" value=""> -->
                      <span class="star" data-value="1">☆</span> <span
                        class="star" data-value="2">☆</span> <span class="star"
                        data-value="3">☆</span> <span class="star" data-value="4">☆</span>
                      <span class="star" data-value="5">☆</span> <input
                        type="hidden" name="r_rate" id="starpoint">
                    </div>
                  </td>
                </tr>
               <tr>
                	<td>
                		<input name="r_img">
                	</td>
                </tr> 
              <%--   <tr>
                  <td><input type="hidden" class="form-control-file"
                    name="r_id" value="${account.id }"></td>
                </tr> --%>
              </tbody>
            </table>
          </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button class="btn btn-primary">작성</button>
      </div>
        </form>
      </div>
    </div>
  </div>
</div>

    


   









   
    <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
      integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
      integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="resources/css/detail.css" />
  
</body>
</html>