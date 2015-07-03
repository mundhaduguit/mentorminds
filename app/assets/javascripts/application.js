// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require pixlr
$( document ).ready(function() {
      pixlr.settings.target = 'http://localhost:3000';
      pixlr.settings.exit = 'http://localhost:3000';
      pixlr.settings.method = 'GET';
      pixlr.settings.redirect = false;
    $('.next').click(function () {
        $('.active').removeClass('active').toggle( "slide" )
            .next().toggle( "slide" ).addClass('active');
       /* if ($('.current').hasClass('last')) {
            $('.next').attr('disabled', true);
        }*/
        $('.prev').attr('disabled', null);
    });
    $('.prev').click(function() {

        $('.active').removeClass('active').toggle( "slide" )
            .prev().toggle( "slide" ).addClass('active');
        /*if ($('.current').hasClass('first')) {
            $('.prev').attr('disabled', true);
        }*/
        $('.next').attr('disabled', null);
    });
    $(".change_user_id").click(function  () {
        
        $("#user_answer_user_challenge_id").val($(this).attr("userChallenge"));
    });
});


function show_companies(category_id){
	//alert(category_id);
	$(".companies_dispaly_div").hide();
	$("#companies_list_"+category_id).show();
}


function show_companies_hover(){
  $(".industory_category_div_new").mouseover(function(){
      //alert($(this).attr("id"));
      var category_id = $(this).attr("id");
      $(".companies_dispaly_div").hide();
      $("#companies_list_"+category_id).show();

  });

  $(".industory_category_div_new").mouseleave(function(){
      //alert($(this).attr("id"));
      //$(".companies_dispaly_div").hide();
      
  });
}

function hide_show_student_industory(){
  $('#open_admin_student_info').hide();
  $('.admin_company_info_tittle').click(function(){
    $('#open_admin_student_info').hide();
    $('#open_admin_company_info').show();
    
  }); 

  $('.admin_student_info_tittle').click(function(){
    
    $('#open_admin_company_info').hide();
    $('#open_admin_student_info').show();
    
  });  
}