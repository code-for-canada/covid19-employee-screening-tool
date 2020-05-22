package covid

import grails.gorm.services.Service

@Service(Screening)
interface ScreeningService {

    Screening get(Serializable id)

    List<Screening> list(Map args)

    Long count()

    void delete(Serializable id)

    Screening save(Screening screening)

}