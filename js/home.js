
var me={token:null,piece_color:null};
var game_status={};
var board={};
var last_update=new Date().getTime();
var timer=null;

(function () {
	//draw_empty_board();
	//fill_board();
	
	$('#bc_login').click( login_to_game);
	//$('#chess_reset').click( reset_board);
	//$('#do_move').click( do_move);
//	$('#move_div').hide();
	game_status_update();
	//$('#the_move_src').change( update_moves_selector);
	//$('#do_move2').click( do_move2);
});
  


function login_to_game() {
	if($('#username').val()=='') {
	alert('You have to set a username');
	return;
	}
	var p_color = $('#pcolor').val();
		$.ajax({url: "backgammon.php/players/"+p_color,
		method: 'PUT',
		dataType: "json",
		contentType: 'application/json',
		data: JSON.stringify( {username:$('#username').val(),
		piece_color: p_color}),
		success: login_result,
		error: login_error});
}


function login_error(data,y,z,c) {
	var x = data.responseJSON;
	alert(x.errormesg);
	}
	
function login_result(data) {
	me = data[0];
	$('#game_initializer').hide();
	update_info();
	game_start();
} 


function rules() {
  var modal = document.getElementById("rules");


var btn = document.getElementById("back");


var span = document.getElementsByClassName("close")[0];


btn.onclick = function() {
  modal.style.display = "block";
}


span.onclick = function() {
  modal.style.display = "none";
}


window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
}