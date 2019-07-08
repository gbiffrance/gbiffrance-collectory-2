grails.project.groupId = "fr.gbif.portail" // change this to alter the default package name and Maven publishing destination

appName = "gbiffrance-collectory"

grails.appName = appName

default_config = "/data/${appName}/config/${appName}-config.properties"
if(!grails.config.locations || !(grails.config.locations instanceof List)) {
    grails.config.locations = []
}
if (new File(default_config).exists()) {
    println "[${appName}] Including default configuration file: " + default_config;
    grails.config.locations.add "file:" + default_config
} else {
    println "[${appName}] No external configuration file defined."
}

println "[${appName}] (*) grails.config.locations = ${grails.config.locations}"
println "default_config = ${default_config}"


/******************************************************************************\
 *  SKINNING
 \******************************************************************************/

skin.layout = 'ala'
skin.benin.layout = 'benin'
skin.togo.layout = 'togo'


skin.orgNameLong = "GBIF France"
skin.orgNameShort = "GBIF France"
skin.benin.orgNameLong = "GBIF Bénin"
skin.benin.orgNameShort = "GBIF Bénin"
skin.togo.orgNameLong = "GBIF Togo"
skin.togo.orgNameShort = "GBIF Togo"
// whether crumb trail should include a home link that is external to this webabpp - ala.baseUrl is used if true
skin.includeBaseUrl = true
skin.taxaLinks.baseUrl = ""
skin.headerUrl = "classpath:resources/generic-header.jsp" // can be external URL
skin.footerUrl = "classpath:resources/generic-footer.jsp" // can be external URL
headerAndFooter.baseURL= "http://layout.gbif.fr"
skin.favicon= "http://layout.gbif.fr/picture/favicon.ico"
headerAndFooter.benin.baseURL="http://layout.gbifbenin.org"
headerAndFooter.togo.baseURL="http://layout.togo.gbif.fr"
skin.benin.favicon= "http://layout.gbifbenin.org/picture/favicon.ico"
skin.benin.favicon= "http://layout.togo.gbif.fr/picture/favicon.ico"
skin.fluidLayout = true // true or false
skin.useAlaSpatialPortal = true
skin.useAlaBie = false
skin.taxaLinks.baseUrl = "" // 3rd party species pages. Leave blank for no links
test.var = "gbiffrance-collectory"

/******************************************************************************\
 *  CAS SETTINGS
 *
 *  NOTE: Some of these will be ignored if default_config exists
 \******************************************************************************/
security.cas.bypass = true

/******************************************************************************\
*  EXTERNAL SERVERS
\******************************************************************************/
if (!bie.baseURL) {
    bie.baseURL = "http://bie.ala.org.au/"
}
if (!bie.searchPath) {
    bie.searchPath = "/search"
}
if (!biocacheUiURL) {
    biocacheUiURL = "http://recherche.gbif.fr"
}
if (!biocacheUiBeninURL) {
    biocacheUiBeninURL = "http://recherche.gbifbenin.org"
}
if (!biocacheUiTogoURL) {
    biocacheUiTogoURL = "http://recherche.togo.gbif.fr"
}
if(!biocacheServicesUrl){
    biocacheServicesUrl = "http://recherche-ws.gbif.fr"
}

if (!spatial.baseURL) {
    spatial.baseURL = "http://spatial.gbif.fr/"
}
if (!ala.baseURL) {
    ala.baseURL = "http://portail.gbif.fr"
}

if (!gbifbenin.baseURL) {
    gbifbenin.baseURL= "http://portail.gbifbenin.org"
}
if (!gbiftogo.baseURL) {
    gbiftogo.baseURL= "http://portail.togo.gbif.fr"
}

if(!alertUrl){
    alertUrl = "http://alerts.ala.org.au/"
}
if(!speciesListToolUrl){
    speciesListToolUrl = "http://listes.gbif.fr"
}
if(!alertResourceName){
    alertResourceName = "Atlas"
}
if(!uploadFilePath){
    uploadFilePath = "/data/gbiffrance-collectory/upload/"
}
if(!uploadExternalUrlPath){
    uploadExternalUrlPath = "/upload/"
}
if (!gbifApiUrl) {
    gbifApiUrl = 'http://api.gbif.org/v1'
}
if (!cartodb.pattern) {
    cartodb.pattern = 'http://cartodb-basemaps-${s}.global.ssl.fastly.net/light_nolabels/${z}/${x}/${y}.png'
}
/******************************************************************************\
*  RELOADABLE CONFIG
\******************************************************************************/
//reloadable.cfgPollingFrequency = 1000 * 60 * 60 // 1 hour
//reloadable.cfgPollingRetryAttempts = 5
//reloadable.cfgs = ["file:/data/collectory/config/Collectory-config.properties"]
reloadable.cfgs = ["file:/data/${appName}/config/${appName}-config.properties"]

/******************************************************************************\
*  TEMPLATES
\******************************************************************************/
if (!citation.template) {
    citation.template = 'Enregistrement fournis par @entityName@, accessible via le site du GBIF France.'
}
if (!citation.link.template) {
    citation.link.template = 'Pour plus information : @link@'
}
if (!citation.rights.template) {
    citation.rights.template = ''
}
if (!resource.publicArchive.url.template) {
    resource.publicArchive.url.template = "${biocacheUiURL}/archives/@UID@/@UID@_ror_dwca.zip"
}
/******************************************************************************\
*  ADDITIONAL CONFIG
\******************************************************************************/
if(!projectNameShort){
    projectNameShort="Atlas"
}
if(!projectName){
    projectName="Atlas of Living France"
}
if(!regionName){
    regionName="France"
}
if(!collectionsMap.centreMapLon){
    collectionsMap.centreMapLon = '43.94834'
}
if(!collectionsMap.centreMapLat){
    collectionsMap.centreMapLat = '-4.80892'
}
if(!collectionsMap.defaultZoom){
    collectionsMap.defaultZoom = '2'
}
if(!eml.organizationName){
    eml.organizationName="GBIF France"
}
if(!eml.deliveryPoint){
    eml.deliveryPoint="\n" + "GBIF FRANCE, MNHN Géologie, 43 rue Buffon CP 48 – 75005 Paris  –  France "
}
if(!eml.city){
    eml.city="Paris"
}
if(!eml.administrativeArea){
    eml.administrativeArea=""
}
if(!eml.postalCode){
    eml.postalCode="75005"
}
if(!eml.country){
    eml.country="France"
}
if(!eml.electronicMailAddress){
    eml.electronicMailAddress = "gbif@gbif.fr"
}
if (!gbifApiUrl) {
    gbifApiUrl = 'http://api.gbif.org/v1'
}
if (!institution.codeLoaderURL) {
    institution.codeLoaderURL = 'file:/data/collectory/bootstrap/institution_codes.xml'
}

apikey = 'AIzaSyAJDtEeoy7Sc9pij2TAoVnmTwA34Q-2VHk'

///******* standard grails **********/
grails.project.groupId = 'au.org.ala' // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = true
grails.mime.types = [ html: ['text/html','application/xhtml+xml'],
                      xml: ['text/xml', 'application/xml'],
                      text: 'text/plain',
                      js: 'text/javascript',
                      rss: 'application/rss+xml',
                      atom: 'application/atom+xml',
                      css: 'text/css',
                      csv: 'text/csv',
                      tsv: 'text/tsv',
                      all: '*/*',
                      json: ['application/json','text/json'],
                      form: 'application/x-www-form-urlencoded',
                      multipartForm: 'multipart/form-data'
]
// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
//grails.resources.uri.prefix = ''
grails.resources.adhoc.patterns = ['/img/*', '/images/*', '/data/*', '/css/*', '/js/OpenLayers/**', '/js/**', '/plugins/**']
grails.resources.work.dir = "/data/${appName}/cache/"
grails.resources.resourceLocatorEnabled = true

// The default codec used to encode data with ${}
grails.views.default.codec="html" // none, html, base64
grails.views.gsp.encoding="UTF-8"
grails.converters.encoding="UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder=false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// whether to install the java.util.logging bridge for sl4j. Disable fo AppEngine!
grails.logging.jul.usebridge = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// MEW tell the framework which packages to search for @Validateable classes
grails.validateable.packages = ['au.org.ala.collectory']

/******* location of images **********/
// default location for images
repository.location.images = '/data/gbiffrance-collectory/data'

grails.plugins.cookie.cookieage.default = 360 * 24 * 60 * 60

disableOverviewMap=false
disableAlertLinks=false
disableLoggerLinks=false


/******************************************************************************\
*  ENVIRONMENT SPECIFIC
\******************************************************************************/

hibernate = "off"

/******************************************************************************\
*  AUDIT LOGGING
\******************************************************************************/
auditLog {
    actorClosure = { request, session ->
        def cas = session?.getAttribute('_const_cas_assertion_')
        def actor = cas?.getPrincipal()?.getName()
        if (!actor) {
            actor = request.getUserPrincipal()?.attributes?.email
        }
        if (!actor) {
            actor = session.username  // injected by data controller for web services
        }
        return actor ?: "anonymous"
    }
    TRUNCATE_LENGTH = 2048
}
auditLog.verbose = false
auditLog.auditDomainClassName = 'au.org.ala.audit.AuditLogEvent'

environments {
    development {
        serverName = 'http://dev.ala.org.au:8080'
        grails.serverURL = 'http://dev.ala.org.au:8080/' + appName
    }
    test {
    }
    production {
    }
}

def loggingDir = (System.getProperty('catalina.base') ? System.getProperty('catalina.base') + '/logs'  : '/var/log/tomcat6')
if(!new File(loggingDir).exists()){
    loggingDir = "/tmp"
}

log4j = {
    appenders {
        environments {
            production {
                rollingFile name: "tomcatLog", maxFileSize: 102400000, file: loggingDir + "/ala-collectory.log",
                        threshold: org.apache.log4j.Level.INFO, layout: pattern(conversionPattern: "%d %-5p [%c{1}] %m%n")
            }
            development {
                console name: "stdout", layout: pattern(conversionPattern: "%d %-5p [%c{1}]  %m%n"), threshold: org.apache.log4j.Level.DEBUG
            }
            test {
                console name: "stdout", layout: pattern(conversionPattern: "%d %-5p [%c{1}]  %m%n"), threshold: org.apache.log4j.Level.INFO
            }
        }
    }

    root {
        // change the root logger to my tomcatLog file
        error 'tomcatLog'
        warn 'tomcatLog'
        additivity = true
    }
    error   'org.codehaus.groovy.grails.web.servlet',        // controllers
            'org.codehaus.groovy.grails.web.pages',          // GSP
            'org.codehaus.groovy.grails.web.sitemesh',       // layouts
            'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
            'org.codehaus.groovy.grails.web.mapping',        // URL mapping
            'org.codehaus.groovy.grails.commons',            // core / classloading
            'org.codehaus.groovy.grails.plugins',            // plugins
            'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
            'org.springframework',
            'org.hibernate',
            'net.sf.ehcache.hibernate',
            'grails.app.service.org.grails.plugin.resource',
            'au.org.ala.bootstrap2'
    info    'grails.app'
    debug   'grails.app.services',
            'grails.app.controllers',
            'grails.app.services',
            'au.org.ala.collectory'
}
// Uncomment and edit the following lines to start using Grails encoding & escaping improvements

/* remove this line 
// GSP settings
grails {
    views {
        gsp {
            encoding = 'UTF-8'
            htmlcodec = 'xml' // use xml escaping instead of HTML4 escaping
            codecs {
                expression = 'html' // escapes values inside null
                scriptlet = 'none' // escapes output from scriptlets in GSPs
                taglib = 'none' // escapes output from taglibs
                staticparts = 'none' // escapes output from static template parts
            }
        }
        // escapes all not-encoded output at final stage of outputting
        filteringCodecForContentType {
            //'text/html' = 'html'
        }
    }
}
remove this line */
