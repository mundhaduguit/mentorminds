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
    $(".locked").children().attr('disabled', 'disabled');
    $('.next').click(function () {
        $('.active_slide').removeClass('active_slide').toggle( "slide" )
            .next().toggle( "slide" ).addClass('active_slide');
    });
    $('.prev').click(function() {

        $('.active_slide').removeClass('active_slide').toggle( "slide" )
            .prev().toggle( "slide" ).addClass('active_slide');


    });
    $(".change_user_id").click(function  () {
        
        $("#user_answer_user_challenge_id").val($(this).attr("userChallenge"));
    });
    i=1
    setInterval(function() {
        score = $(".score").text();
        first_date = parseInt($(".score").attr("first_day"))

        current_day =  parseInt($("."+i+"_date").text())
        if(first_date < current_day)
        {

            score = score - 100;
        }
        $(".score").text(score);
        $("."+i+"_date").addClass("high");
        i=i+1
    }, 10 * 1000); // 60 * 1000 milsec
});


function show_companies(category_id){
	//alert(category_id);
	$(".companies_dispaly_div").hide();
	$("#companies_list_"+category_id).show();
}

