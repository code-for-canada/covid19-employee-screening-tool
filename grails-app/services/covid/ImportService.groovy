package covid

import grails.gorm.transactions.Transactional
import org.apache.poi.ss.usermodel.DataFormatter
import org.apache.poi.ss.usermodel.DateUtil

@Transactional
class ImportService {

    def importFile(workbook) {

        def sheetheader = []
        def values = []
        def sheet = workbook.getSheetAt(0)

        for (cell in sheet.getRow(0).cellIterator()) {
            sheetheader << cell.stringCellValue
        }

        DataFormatter df = new DataFormatter()

        def headerFlag = true
        for (row in sheet.rowIterator()) {
            if (headerFlag) {
                headerFlag = false
                continue
            }
            def value = ''
            def map = [:]
            for (cell in row.cellIterator()) {
                switch(cell.cellType) {
                    case 1:
                        value = cell.stringCellValue
                        map["${sheetheader[cell.columnIndex]}"] = value
                        break
                    case 0:
                        value = cell.numericCellValue
                        map["${sheetheader[cell.columnIndex]}"] = df.formatCellValue(cell)
                        break
                    default:
                        value = ''
                }
            }
            values.add(map)
        }

        values.each { v ->
            if(v) {
                if (v.firstName) {
                    new Employee(
                            firstName: v.firstName,
                            lastName: v.lastName,
                            contactNumber: v.contactNumber,
                            employeeNumber: v.'employeeNumber'
                    ).save(failOnError: true)
                }
            }
        }
    }

}
