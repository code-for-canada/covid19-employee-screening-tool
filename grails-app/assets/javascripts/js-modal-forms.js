/* Load partial template into modal with ID "myModal" */
function loadTemplate(element) {
    resetModal();
    var templateUrl = $(element).attr("data-template-url");
    var title = $(element).attr("data-title");
    $('.modal-title').html(title);
    $('.modal-body').load(templateUrl, function() { });
    $('#modal-default').modal({
        backdrop:'static'
    });
}

/* Submit data from modal form */
function submitForm(element) {

    //DIV to load html template into on successful submit
    var refreshDiv = $(element).attr("data-refresh-div");

    var $form = $(element);
    url = $form.attr('action');
    var posting = $.post(url, $(element).serialize());

    resetModal();

    posting.done(function(data) {
        if (data.success) {
            $(refreshDiv).html(data.html);
            $('#modal-default').modal('hide');
        } else {
            $('.modal-body').html(data.html);
        }
    });
}

/* Show spinner when loading new template */
function resetModal() {
    $('.modal-body').html('<div class="progress"><div class="progress-bar progress-bar-striped active" role="progressbar" style="width:100%"></div></div>');
}