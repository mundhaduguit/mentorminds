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
    $('.next').click(function () {
        alert("here");
        $('.current').removeClass('current').hide()
            .next().show().addClass('current');
        if ($('.current').hasClass('last')) {
            $('.next').attr('disabled', true);
        }
        $('.prev').attr('disabled', null);
    });
    $('.prev').click(function() {
        alert("here");
        $('.current').removeClass('current').hide()
            .prev().show().addClass('current');
        if ($('.current').hasClass('first')) {
            $('.prev').attr('disabled', true);
        }
        $('.next').attr('disabled', null);
    });
});


function show_companies(category_id){
	//alert(category_id);
	$(".companies_dispaly_div").hide();
	$("#companies_list_"+category_id).show();
}
