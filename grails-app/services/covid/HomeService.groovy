package covid

import grails.gorm.services.Service

@Service(Home)
interface HomeService {

    Home get(Serializable id)

    List<Home> list(Map args)

    Long count()

    void delete(Serializable id)

    Home save(Home home)

}