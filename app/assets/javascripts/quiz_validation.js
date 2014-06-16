$(document).ready(function() {

	$('input[type="submit"]').click(function(e) {
		e.preventDefault();

		// Flaga putych inputów
		var empyInput = false;

		// Div na błędy
		var error = $('<div />').addClass('alert alert-danger');

		// Inputy
		$('#new_quiz').find('input').not('[type="checkbox"]').each(function() {
			if( $(this).val() == "" ) {
				empyInput = true;
				$(this).parent().addClass('has-error');

				// Append error msg
				var errMsgObj = $('<p />');
				var errMsg = '';
				if( $(this).hasClass('question-input') ) {
					errMsg += 'Question ';
				} else if( $(this).hasClass('answer-input') ) {
					errMsg += 'Answer ';
				} else if( $(this).attr('name') == "quiz[name]" ) {
					errMsg += 'Name ';
				}

				errMsg += "can't be blank";
				errMsgObj.html( errMsg ); 
				error.append( errMsgObj );
			}
		});

		// Textarea
		$('#new_quiz').find('textarea').each(function() {

			if( $(this).val() == "" ) {
				empyInput = true;
				$(this).parent().addClass('has-error');

				// Append error msg
				var errMsgObj = $('<p />');
				var errMsg = '';
				if( $(this).attr('name') == "quiz[short_description]" ) {
					errMsg += 'Short description ';
				} else if( $(this).attr('name') == "quiz[description]" ) {
					errMsg += 'Description ';
				}

				errMsg += "can't be blank";
				errMsgObj.html( errMsg ); 
				error.append( errMsgObj );
			}

		});

		if( !empyInput ) {
			$('#new_quiz').submit();
		} else {
			$('.alert-warning').after( error );
		}
	});

});