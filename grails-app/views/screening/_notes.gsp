<form class="js-submit" action="/screening/updateNotes" data-refresh-div="#screeningList">

    <g:hiddenField name="id" value="${this.screening?.id}" />
    <g:hiddenField name="version" value="${this.screening?.version}" />

    <div class="form-group">
        <label for="notes">Notes</label>
        <g:textArea name="notes" class="form-control" value="${screening.notes}" rows="3" />
    </div>

    <div class="text-center">
        <g:submitButton name="create" class="btn btn-primary" value="Update" />
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
    </div>
</form>

<g:javascript>
    $('.js-submit').submit(function(event) {
        event.preventDefault();
        submitForm(this);
    });
</g:javascript>