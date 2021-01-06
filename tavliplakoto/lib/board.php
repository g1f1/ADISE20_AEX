<?php



   
function move_piece($x,$y,$x2,$y2,$token) {
	
	if($token==null || $token=='') {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"token is not set."]);
		exit;
	}
	
	$color = current_color($token);
	if($color==null ) {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"You are not a player of this game."]);
		exit;
	}
	$status = read_status();
	if($status['status']!='started') {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"Game is not in action."]);
		exit;
	}
	if($status['p_turn']!=$color) {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"It is not your turn."]);
		exit;
	}
	$orig_board=read_board();
	$board=convert_board($orig_board);
	$n = add_valid_moves_to_piece($board,$color,$x,$y);
	if($n==0) {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"This piece cannot move."]);
		exit;
	}
	foreach($board[$x][$y]['moves'] as $i=>$move) {
		if($x2==$move['x'] && $y2==$move['y']) {
			do_move($x,$y,$x2,$y2);
			exit;
		}
	}
	header("HTTP/1.1 400 Bad Request");
	print json_encode(['errormesg'=>"This move is illegal."]);
	exit;
}
		
function show_board($input) {
	global $mysqli;
	
	$b=current_color($input['token']);
	if($b) {
		show_board_by_player($b);
	} else {
		header('Content-type: application/json');
		print json_encode(read_board(), JSON_PRETTY_PRINT);
	}
}

function reset_board() {
	global $mysqli;
	$sql = 'call clean_board()';
	$mysqli->query($sql);
	
}

function read_board() {
	global $mysqli;
	$sql = 'select * from board';
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	return($res->fetch_all(MYSQLI_ASSOC));
}

function convert_board(&$orig_board) {
	$board=[];
	foreach($orig_board as $i=>&$row) {
		$board[$row['x']][$row['y']] = &$row;
	} 
	return($board);
}

function show_board_by_player($b) {

	global $mysqli;

	$orig_board=read_board();
	$board=convert_board($orig_board);
	$status = read_status();
	if($status['status']=='started' && $status['p_turn']==$b && $b!=null) {
		// It my turn !!!!
		$n = add_valid_moves_to_board($board,$b);
		
		// Εάν n==0, τότε έχασα !!!!!
		// Θα πρέπει να ενημερωθεί το game_status.
	}
	header('Content-type: application/json');
	print json_encode($orig_board, JSON_PRETTY_PRINT);
}

function add_valid_moves_to_board(&$board,$b) {
	$number_of_moves=0;
	
	for($x=1;$x<9;$x++) {
		for($y=1;$y<9;$y++) {
			$number_of_moves+=add_valid_moves_to_piece($board,$b,$x,$y);
		}
	}
	return($number_of_moves);
}

function add_valid_moves_to_piece(&$board,$b,$x,$y) {
	$number_of_moves=0;
	if($board[$x][$y]['piece_color']==$b) {
		switch($board[$x][$y]['piece']){
			case 'P1': $number_of_moves+=pawn_moves($board,$b,$x,$y);break;
			case 'P2': $number_of_moves+=king_moves($board,$b,$x,$y);break;
			case 'P3': $number_of_moves+=queen_moves($board,$b,$x,$y);break;
			case 'P4': $number_of_moves+=rook_moves($board,$b,$x,$y);break;
			case 'P5': $number_of_moves+=knight_moves($board,$b,$x,$y);break;
			case 'P6': $number_of_moves+=bishop_moves($board,$b,$x,$y);break;
		}
	} 
	return($number_of_moves);
}

function king_moves(&$board,$b,$x,$y) {
	$directions = [
		[1,0],
		[-1,0],
		[0,1],
		[0,-1],
		[1,1],
		[-1,1],
		[1,-1],
		[-1,-1]
	];	
	$moves=[];
	foreach($directions as $d=>$direction) {
		$i=$x+$direction[0];
		$j=$y+$direction[1];
		if ( $i>=1 && $i<=8 && $j>=1 && $j<=8 && $board[$i][$j]['piece_color'] != $b) {
			$move=['x'=>$i, 'y'=>$j];
			$moves[]=$move;
		}
	}
	$board[$x][$y]['moves'] = $moves;
	return(sizeof($moves));
}
function queen_moves(&$board,$b,$x,$y) {
	$directions = [
		[1,0],
		[-1,0],
		[0,1],
		[0,-1],
		[1,1],
		[-1,1],
		[1,-1],
		[-1,-1]
	];	
	return(bishop_rook_queen_moves($board,$b,$x,$y,$directions));

}
function rook_moves(&$board,$b,$x,$y) {
	$directions = [
		[1,0],
		[-1,0],
		[0,1],
		[0,-1]
	];	
	return(bishop_rook_queen_moves($board,$b,$x,$y,$directions));
}
function bishop_moves(&$board,$b,$x,$y) {
	$directions = [
		[1,1],
		[-1,1],
		[1,-1],
		[-1,-1]
	];	
	return(bishop_rook_queen_moves($board,$b,$x,$y,$directions));
}

function bishop_rook_queen_moves(&$board,$b,$x,$y,$directions) {
	$moves=[];

	foreach($directions as $d=>$direction) {
		for($i=$x+$direction[0],$j=$y+$direction[1]; $i>=1 && $i<=8 && $j>=1 && $j<=8; $i+=$direction[0], $j+=$direction[1]) {
			if( $board[$i][$j]['piece_color'] == null ){ 
				$move=['x'=>$i, 'y'=>$j];
				$moves[]=$move;
			} else if ( $board[$i][$j]['piece_color'] != $b) {
				$move=['x'=>$i, 'y'=>$j];
				$moves[]=$move;
				// Υπάρχει πιόνι αντιπάλου... Δεν πάμε παραπέρα.
				break;
			} else if ( $board[$i][$j]['piece_color'] == $b) {
				break;
			}
		}

	}
	$board[$x][$y]['moves'] = $moves;
	return(sizeof($moves));
}



function knight_moves(&$board,$b,$x,$y) {
	$m = [
		[2,1],
		[1,2],
		[2,-1],
		[1,-2],
		[-2,1],
		[-1,2],
		[-2,-1],
		[-1,-2],
	];
	$moves=[];
	foreach($m as $k=>$t) {
		$x2=$x+$t[0];
		$y2=$y+$t[1];
		if( $x2>=1 && $x2<=8 && $y2>=1 && $y2<=8 &&
			$board[$x2][$y2]['piece_color'] !=$b ) {
			// Αν ο προορισμός είναι εντός σκακιέρας και δεν υπάρχει δικό μου πιόνι
			$move=['x'=>$x2, 'y'=>$y2];
			$moves[]=$move;
		}
	}
	$board[$x][$y]['moves'] = $moves;
	return(sizeof($moves));
}

function pawn_moves(&$board,$b,$x,$y) {
	
	$direction=($b=='W')?1:-1;
	$start_row = ($b=='W')?2:7;
	$moves=[];
	
	$j=$y+$direction;
	if($j<=8 && $j>=1 && $board[$x][$j]['piece_color']==null) {
		$move=['x'=>$x, 'y'=>$j];
		$moves[]=$move;
		$j=$y+2*$direction;
		if($j<=8 && $j>=1 && $y==$start_row && $board[$x][$j]['piece_color']==null) {
			$move=['x'=>$x, 'y'=>$j];
			$moves[]=$move;
		}
	}
	$j=$y+$direction;
	if($j>=1 && $j<=8) {
		for($i=$x-1;$i<=$x+1;$i+=2) {
			if($i>=1 && $i<=8 && $board[$i][$j]['piece_color']!=null && $board[$i][$j]['piece_color']!=$b) {
				$move=['x'=>$i, 'y'=>$j];
				$moves[]=$move;
			}
		}
	}

	$board[$x][$y]['moves'] = $moves;
	return(sizeof($moves));
	
}

function do_move($x,$y,$x2,$y2) {
	global $mysqli;
	$sql = 'call `move_piece`(?,?,?,?);';
	$st = $mysqli->prepare($sql);
	$st->bind_param('iiii',$x,$y,$x2,$y2 );
	$st->execute();

	header('Content-type: application/json');
	print json_encode(read_board(), JSON_PRETTY_PRINT);
}

?>
