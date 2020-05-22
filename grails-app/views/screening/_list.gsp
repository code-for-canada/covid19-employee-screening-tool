

<table id="screeningTable" class="table table-hover" style="display: none;" width="100%">
    <thead>
    <tr>
        <th colspan="4"></th>
        <th colspan="6" class="text-center border-left">Start of Shift</th>
        <th colspan="3" class="text-center border-left">End of Shift</th>
        <th colspan="2" class="border-left"></th>
    </tr>
    <tr>
        <th>Date</th>
        <th>Employee</th>
        <th>Contact Number</th>
        <th>Home</th>
        <th>Fever In</th>
        <th>Onset of Symptoms In</th>
        <th>Travel</th>
        <th>Contact</th>
        <th>PPE Worn</th>
        <th>Screened In By</th>
        <th>Fever Out</th>
        <th>Onset of Symptoms Out</th>
        <th>Screened Out By</th>
        <th>Has Flag(s)</th>
        <th>Notes</th>
    </tr>
    </thead>
    <tbody>
        <g:each in="${screeningList}" var="screening">
            <tr>
                <td>${screening.dateCreated.format('yyyy-MM-dd HH:mm')}</td>
                <td><g:link action="show" id="${screening.id}">${screening.employee}</g:link></td>
                <td>${screening.phoneNumber}</td>
                <td>${screening.home}</td>
                <td class="text-center">
                    ${screening.feverIn ? 'Yes' : 'No'} (${screening.temperatureIn}&deg;C)
                </td>
                <td class="text-center">
                    ${screening.newOnsetIn ? 'Yes' : 'No'}
                </td>
                <td class="text-center">
                    ${screening.travelOutsideCanada ? 'Yes':'No'}
                </td>
                <td class="text-center">
                    ${screening.contactPositive ? 'Yes':'No' }
                </td>
                <td class="text-center">
                    ${screening.requiredPPEWorn ? 'Yes':'No' }
                </td>
                <td>${screening.screenedByIn}</td>
                <g:if test="${screening.screenedByOut}">
                    <td class="text-center">
                        ${screening.feverOut ? 'Yes' : 'No'} (${screening.temperatureOut}&deg;C)
                    </td>
                    <td class="text-center">
                        ${screening.newOnsetOut ? 'Yes' : 'No'}
                    </td>
                    <td>${screening.screenedByOut}</td>
                </g:if>
                <g:else>
                    <td></td><td></td><td></td>
                </g:else>
                <td>
                    <g:if test="${screening.feverIn || screening.newOnsetIn
                            || screening.travelOutsideCanada || screening.contactPositive
                            || screening.feverOut || screening.newOnsetOut}">
                            <span class="badge badge-danger">Yes</span>
                    </g:if>
                    <g:else>
                        No
                    </g:else>
                </td>
                <td>
                    ${screening.notes}
                    <a href="#" class="js-modal pull-right" data-title="Edit Notes"
                       data-template-url="${g.createLink(action:'editNotes', controller: 'Screening', params: [id: screening.id])}"
                       title="Edit Notes">
                        <i class="fas fa-edit float-right"></i>
                    </a>
                </td>
            </tr>
        </g:each>
    </tbody>
</table>

<g:javascript>
    $(document).ready(function() {
        $('.js-modal').click(function() {
            loadTemplate(this);
        });

        $(function () {
            $('[data-toggle="popover"]').popover()
        })

        var table = $('#screeningTable').DataTable({
            "aaSorting": [],
            stateSave: true,
            columnDefs: [
                {
                    visible:false
                }
            ],
            buttons: [
                {
                    extend: 'colvis',
                    columns: ':not(.noVis)',
                    text: "Columns"
                },
                'excel'
            ]
        });
        $('#screeningTable').show();

        table.buttons().container()
                .appendTo('#screeningTable_length');

    });
</g:javascript>