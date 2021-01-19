// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require jquery_ujs

//= require_tree .  

/*

//Carousel


$(document).on('turbolinks:load', function(){
    $('.carousel').slick({
      autoplay:true, 
      //dots:true,  
      prevArrow: '<button class="slide-arrow prev-arrow"></button>',
      nextArrow: '<button class="slide-arrow next-arrow"></button>',
      
    });
  });

  $(document).on('turbolinks:load', function(){
    $('.multiple').slick({
      autoplay:true,
      //dots:true,     
      autoplaySpeed: 4000,
    　slidesToShow: 3, //表示するスライドの数
    　slidesToScroll: 3, //スクロールで切り替わるスライドの数
      prevArrow: '<button class="slide-arrow prev-arrow"></button>',
      nextArrow: '<button class="slide-arrow next-arrow"></button>',
    　 //レスポンシブ対応させたい場合は以下も記述
    　 responsive: [
        {
          breakpoint: 768,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 2,
          }
        },

        {
          breakpoint: 575,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1,
            
          }
        }
      ]
    });
  });
*/


//サイドバーを固定＆解除

  window.onload=function() {

    // コンテンツ部分の高さ
    var contentHeight = $("#content_border").height();
    // サイドバーの親要素の高さ
    var sidebarHeight = $("#sidebar_sub").height();
    var sidebarHeight1 = $("#sidebar_sub1").height();
    var sidebarHeight2 = $("#sidebar_sub2").height();
    var w = $(window);
  
    // サイドバーの親要素の高さがコンテンツ部分の高さより小さい時
    if(sidebarHeight < contentHeight) {
  
      // サイドバーの親要素の高さをコンテンツ部分の高さに合わせる
      $("#sidebar").css("height", contentHeight);
  
      // サイドバーを変数に代入
      var sidebarSub = $("#sidebar_sub");
      // サイドバーを固定したい位置を取得し変数に代入
  　　var sidebarScrollStop
      = $("#header_bar").height() + $("#sidebar_sub").height() + 36 + 24
      - w.height();
      // サイドバーの固定を解除したい位置を取得し変数に代入
      var sidebarScrollStart
      = $("#header_bar").height() + $("#content_border").height() + 24
      - w.height();
  
      // ウィンドウがスクロールされた時に処理を実行
      w.scroll(function() {
  
        // 「scrollTopの位置」が「サイドバーを固定したい位置」より大きく、
        // 「サイドバーの固定を解除したい位置」より小さい時
        if(sidebarScrollStop < w.scrollTop()
        && w.scrollTop() < sidebarScrollStart) {
  
          // サイドバーを固定する処理
          sidebarSub.css({"position": "fixed", "bottom": "1.9rem"});
  
        // 「scrollTopの位置」が「サイドバーの固定を解除したい位置」より大きい時
        } else if(w.scrollTop() >= sidebarScrollStart) {
  
          // サイドバーの固定を解除する処理
          sidebarSub.css({"position": "absolute", "bottom": "12rem"});
  
        // それ以外のとき
        // （「scrollTopの位置」が「サイドバーを固定したい位置」より小さい時）
        } else {
  
          // サイドバーを通常の位置に戻す
          sidebarSub.css("position", "static");
  
        }
  
      });
  
    } 

    
  
  }

  //適性診断テスト
  
//ボタンを押すごとに画面が切り替わる関数
$(function () {

  $(".btn").on("click", function () {
    $(this).closest("div").css("display", "none");
    id = $(this).attr("href");
    $(id).addClass("fit").fadeIn("slow").show();
  });



//選択ボタンデータを配列に入れてカウントする関数
    var countA;
    var countB;
    var box =[];
  $(".btn").each(function(){
    $(this).on('click',function(){
      var value = $(this).data("value");
       box.push(value);

      countA = box.filter(function(x){
                    return x === "a"
                  }).length;
      countB = box.filter(function(y){
                      return y === "b"
                  }).length;
    });
  });


//結果を出力する関数
  $('.end').on('click',function(){
    if( countA > countB ) {
      $('#answer_01').css("display",""); //回答1
    } else {
      $('#answer_02').css("display","");//回答2
  }
});

});

// 投稿数の数に応じてメダル設置＆背景色 or 枠線を変更する

 var post_count = user.posts.count
 var pc = document.getElementById('post-count')

 
if (post_count > 10) {
  pc.style.color = 'blue'

  } else if (post_count > 3) {
    pc.style.color = 'red'
  }
  else {
    pc.style.color = 'yellow'
  }








/*

// ページが読み込まれたら実行
window.onload = function() {

  // オブジェクトと変数の準備
  var count_disp = document.getElementById("disp_count");  
  var count_up_btn = document.getElementById("btn_count_up");
  var reset_btn = document.getElementById("btn_reset");
  var count_value = 0;

  // オブジェクトと変数の準備
  var count_disp = document.getElementById("disp_count");  
  var count_up_btn = document.getElementById("btn_count_up");
  var count_value = 0;

  // カウントアップボタンクリック処理
  count_up_btn.addEventListener('click', () => {
    count_value += 1;
    count_disp.innerHTML = count_value;

  });

   // カウントアップボタンクリック処理
   count_up_btn.addEventListener('mousedown', () => {
    count_up_btn.style.backgroundColor = "#00FF00";

  });

   // カウントアップボタンクリック処理
   count_up_btn.addEventListener('mouseup', () => {
    count_up_btn.style.backgroundColor = "";

  });
};

*/
    
 
  
/*
// 発音回数を記録する
// ページが読み込まれたら実行
window.onload = function() {

  // オブジェクトと変数の準備
  var count_press = document.getElementById("press_count");  
  var count_up_btn = document.getElementById("btn_count_up");
  var count_down_btn = document.getElementById("btn_count_down");
  var count_value = 0;

  // カウントアップボタンクリック処理
  count_up_btn.onclick = function (){
       count_value += 1;
       count_press.innerHTML = count_value;
  };
  // カウントアップボタンのマウスダウン処理
  count_up_btn.onmousedown = function() {
       count_up_btn.style.backgroundColor = "#00FF00";
  }
  // カウントアップボタンのマウスアップ処理
  count_up_btn.onmouseup = function() {
       count_up_btn.style.backgroundColor = "";
  }

  // カウントアップボタンクリック処理
  count_down_btn.onclick = function (){
    if (count_value >= 1) {
      count_value -= 1;
      count_press.innerHTML = count_value;
    }
  };
// カウントアップボタンのマウスダウン処理
count_down_btn.onmousedown = function() {
    count_down_btn.style.backgroundColor = "#00FF00";
 }
 // カウントアップボタンのマウスアップ処理
 count_down_btn.onmouseup = function() {
  count_down_btn.style.backgroundColor = "";
 }
};

*/




