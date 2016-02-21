/**
	**options to have following keys:
		**searchText: this should hold the value of search text
		**searchPlaceHolder: this should hold the value of search input box placeholder
**/
(function($){
	$.fn.tableSearch = function(options){
		if(!$(this).is('table')){
			return;
		}
		var tableObj = $(this),
			searchText = (options.searchText)?options.searchText:'Search: ',
			searchPlaceHolder = (options.searchPlaceHolder)?options.searchPlaceHolder:'',
			divObj = $('<fieldset class="form-search"><label for="searchTerm" class="form-label">'+searchText+'</label></fieldset>'),
			inputObj = $('<input type="text" placeholder="'+searchPlaceHolder+'" class="form-field" id="searchTerm" />'),
			caseSensitive = (options.caseSensitive===true)?true:false,
			searchFieldVal = '',
			pattern = '';
		inputObj.off('keyup').on('keyup', function(){
			searchFieldVal = escapeCharacters($(this).val());
			pattern = (caseSensitive)?RegExp(searchFieldVal):RegExp(searchFieldVal, 'i');
			tableObj.find('tbody tr').hide().each(function(){
				var currentRow = $(this);
				currentRow.find('td').each(function(){
					rowHeadline = escapeCharacters($(this).html());
					if(pattern.test(rowHeadline)){
						currentRow.show();
						return false;
					}
				});
			});
		});
		tableObj.before(divObj.append(inputObj));
		return tableObj;
	}
}(jQuery));

function escapeCharacters(input)
{
	return input.replace(/á/g, 'a').replace(/í/g, 'i').replace(/‘/g, '').replace(/’/g, '').replace(/-/g, '')
}
