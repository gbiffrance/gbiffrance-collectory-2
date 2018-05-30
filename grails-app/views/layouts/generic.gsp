<g:set var="orgNameLong" value="${grailsApplication.config.skin.benin.orgNameLong}"/>
<g:set var="orgNameShort" value="${grailsApplication.config.skin.benin.orgNameShort}"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="app.version" content="${g.meta(name:'app.version')}"/>
    <meta name="app.build" content="${g.meta(name:'app.build')}"/>
    <g:set var="favicon" value="${grailsApplication.config.skin.benin.favicon}"/>
    <link href="${favicon}" rel="shortcut icon"  type="image/x-icon"/>
    <g:set var="beninBaseURL" value="${grailsApplication.config.headerAndFooter.benin.baseURL}"/>
    <link href="${beninBaseURL}/css/ala-styles.css" rel="stylesheet" type="text/css"/>
    <meta name="description" content="Exploration des jeux de données connectés via le ${orgNameLong}"/>


    <g:set var="fluidLayout" value="${pageProperty(name:'meta.fluidLayout')?:grailsApplication.config.skin?.fluidLayout}"/>
    <meta name="breadcrumb" content="${pageProperty(name: 'meta.breadcrumb', default: pageProperty(name: 'title').split('\\|')[0].decodeHTML())}"/>
    <meta name="breadcrumbParent" content="${pageProperty(name: 'meta.breadcrumbParent', default: "${createLink(action: 'map', controller: 'public')},${message(code: 'breadcrumb.collections')}")}"/>

    <title><g:layoutTitle/></title>

    <r:script type="text/javascript" disposition="head">
          var COLLECTORY_CONF = {
            contextPath: "${request.contextPath}",
            locale: "${request.locale}",
            cartodbPattern: "${grailsApplication.config.cartodb.pattern}"
          };

          // Init plugins
          jQuery(function(){
              $('.helphover').popover({animation: true, trigger:'hover'});
          });

            $(function(){
                $("#header").load("${beninBaseURL}/banner.html");
                $("#footer").load("${beninBaseURL}/footer.html");
            })
    </r:script>


    <link rel="alternate" type="application/rss+xml" title="RSS Feed" href="${g.createLink(uri:"/feed.xml", absolute: true)}" />

    <r:require modules="jquery, jquery-migration, jquery_i18n, bootstrap,  application, collectory" />

    <r:layoutResources/>
    <g:layoutHead/>
</head>

<body class="${pageProperty(name:'body.class')?:'nav-collections'}" id="${pageProperty(name:'body.id')}" onload="${pageProperty(name:'body.onload')}">
    <r:layoutResources/>
    <!-- Header -->
    <div id="header"></div>
    <!-- End Header -->
    <div class="${fluidLayout?'container-fluid':'container'}" id="main-content">
        <g:layoutBody />
    </div><!--/.container-->
    <div id="footer"></div>
</body>
