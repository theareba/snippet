var ready = function(){
    var render, select;

    render = function(term, data, type) {
        return term.split(' ').slice(0,15).join(' ');
    }

    select = function(term, data, type){
        // populate our search form with the autocomplete result
        $('#search').val(term);

        // hide our autocomplete results
        $('ul#soulmate').hide();

        // then redirect to the result's link
        // remember we have the link in the 'data' metadata
        return window.location.href = data.link
    }

    $('#search').soulmate({
        url: '/autoload/search',
        types: ['snippets'],
        renderCallback : render,
        selectCallback : select,
        minQueryLength : 2,
        maxResults     : 5
    })


}
// when our document is ready, call our ready function
$(document).ready(ready);