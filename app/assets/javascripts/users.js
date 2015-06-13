$(document).ready(function(){
	$('#assist-btn').on('click', function() {
		var $current_name = $('#current-user').text();
		var $array_names = [];
		$array_names.push($current_name)

		var $newParticipant = {participant: $array_names}

		$.ajax({
				type: 'POST',
				url: 'http://localhost:3000/users/'+user_id+'/meetings/'+id,
				data: $newParticipant,
				success: function(){alert('Success: true');},
				error: function(){alert('Success: false');},
				dataType: 'json'
			});
	});
});