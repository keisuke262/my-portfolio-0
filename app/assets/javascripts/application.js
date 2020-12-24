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
//= require turbolinks
//= require_tree .  




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

//サイドバーを固定＆解除

  window.onload=function() {

    // コンテンツ部分の高さ
    var contentHeight = $("#content_border").height();
    // サイドバーの親要素の高さ
    var sidebarHeight = $("#sidebar_sub").height();
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
          sidebarSub.css({"position": "fixed", "bottom": "24px"});
  
        // 「scrollTopの位置」が「サイドバーの固定を解除したい位置」より大きい時
        } else if(w.scrollTop() >= sidebarScrollStart) {
  
          // サイドバーの固定を解除する処理
          sidebarSub.css({"position": "absolute", "bottom": "0"});
  
        // それ以外のとき
        // （「scrollTopの位置」が「サイドバーを固定したい位置」より小さい時）
        } else {
  
          // サイドバーを通常の位置に戻す
          sidebarSub.css("position", "static");
  
        }
  
      });
  
    } 
  
  }





  /* 
  $('.animated').waypoint({
    handler(direction) {
      if(direction === 'down') {
        
        // 後からクラスを追加して特定のタイミングでアニメーションを実行する
        // this.elementはクラスがanimatedである要素のうち、
        // 画面の一番下に来ているものである。
        $(this.element).addClass('fadeInUp');
  
        this.destroy();
  
      }
    },
    // 要素が画面の一番下に着たらhandler実行
    offset: '100%'
  })

  */



  //スクロール値ごとの動きを設定
  /*
$(function() {
  $(window).scroll(function () {
    var top = $(this).scrollTop();
    if(top > 500) {
    
      $("#sidebar").fadeOut('800');
    }
    

  });
});

*/
