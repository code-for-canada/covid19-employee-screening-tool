package covid

import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.apache.poi.xssf.usermodel.XSSFWorkbook

@Secured(['ROLE_COVID_ADMINISTRATORS'])
class ImportController {

    ImportService importService

    def index() {}

    def upload() {

        try {
            def file = request.getFile('file')
            if (!file.empty) {
                def workbook = new XSSFWorkbook(file.getInputStream())
                importService.importFile(workbook)
            }
            flash.message = "Imported employees from file"
        } catch (e) {
            flash.message = e
        }

        redirect action: 'index'
    }

}
