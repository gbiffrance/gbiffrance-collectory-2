<%--
  Created by IntelliJ IDEA.
  User: marie-eliselecoq
  Date: 5/16/18
  Time: 12:54 PM
--%>

<%@ page import="au.org.ala.collectory.CollectoryTagLib; java.text.DecimalFormat; java.text.SimpleDateFormat" %>
<g:set var="orgNameLong" value="${grailsApplication.config.skin.orgNameLong}"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="breadcrumbParent"
          content="${createLink(action: 'datasets', controller: 'public')},${message(code: 'breadcrumb.datasets')}"
    />
    <title><cl:pageTitle>${fieldValue(bean: instance, field: "name")}</cl:pageTitle></title>
    <g:if test="${instance.publishingCountry == 'BJ'}">
        <meta name="layout" content="${grailsApplication.config.skin.benin.layout}"/>
        <r:require modules="datasets_benin_css, jquery, fancybox, jquery_jsonp, jquery_ui_custom, jstree, taxonTree, datadumper, jquery_i18n, collectory, charts_plugin"/>
    </g:if>
    <g:elseif test ="${instance.publishingCountry == 'FR'}">
        <meta name="layout" content="${grailsApplication.config.skin.layout}"/>
        <r:require modules="datasets_css, jquery, fancybox, jquery_jsonp, jquery_ui_custom, jstree, taxonTree, datadumper, jquery_i18n, collectory, charts_plugin"/>
    </g:elseif>
    <r:script>
        // define biocache server
        bieUrl = "${grailsApplication.config.bie.baseURL}";
        loadLoggerStats = ${!grailsApplication.config.disableLoggerLinks.toBoolean()};
        $(document).ready(function () {
            $("a#lsid").fancybox({
                'hideOnContentClick': false,
                'titleShow': false,
                'autoDimensions': false,
                'width': 600,
                'height': 180
            });
            $("a.current").fancybox({
                'hideOnContentClick': false,
                'titleShow': false,
                'titlePosition': 'inside',
                'autoDimensions': true,
                'width': 300
            });
            $('#overviewTabs a:first').tab('show');
        });
    </r:script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">google.load('visualization', '1.0', {'packages':['corechart']});</script>
</head>
<body class="nav-datasets">

<div id="content">
    <cl:pageOptionsPopup instance="${instance}"/>
    <cl:h1 value="${instance.name}"/>
    <section class="row">
        <div class="col-md-8">
            <g:set var="dp" value="${instance.dataProvider}"/>
            <g:if test="${dp}">
                <p class="dataResourceProviderLink"><g:message code="dataResource.dataProvider.label" /> : <g:link action="show" id="${dp.uid}">${dp.name}</g:link></p>
            </g:if>
            <g:if test="${instance.institution}">
                <p class="dataResourceInstitutionLink"><g:message code="institution.dataProvider.label" /> : <g:link action="show" id="${instance.institution.uid}">${instance.institution.name}</g:link></p>
            </g:if>
            <cl:valueOrOtherwise value="${instance.acronym}"><span
                    class="acronym"><g:message code="public.show.header.acronym"/>: ${fieldValue(bean: instance, field: "acronym")}</span></cl:valueOrOtherwise>

        </div>

        <div class="col-md-4">
            <div id="dataAccessWrapper" style="display:none;">
                <g:render template="/plugins/collectory-1.9.2-SNAPSHOT/grails-app/views/public/dataAccess" model="[instance:instance]"/>
            </div>
        </div>
    </section>
    <section id="row">

        <div class="tabbable tabbable-dataresource">
            <ul class="nav nav-tabs" id="overviewTabs">
                <li><a id="tab1" href="#overviewTab" data-toggle="tab"><g:message code="public.show.overviewtabs.overview" /></a></li>
                <li><a id="tab3" href="#descTab" data-toggle="tab"><g:message code="public.des" /></a></li>
                <li><a id="tab2" href="#statTab" data-toggle="tab"><g:message code="map.js.records" /></a></li>
                %{--<li id="imagesTabEl" style="display:none;"><a id="tab3" href="#imagesTab" data-toggle="tab"><g:message code="public.show.overviewtabs.images" /></a></li>--}%
            </ul>
        </div>

        <div class="tab-content">
            <div id="overviewTab"  class="tab-pane active row">
                <div class="col-md-8">
                    <g:if test="${instance.pubDescription || instance.techDescription || instance.focus}">
                        <h2><g:message code="public.des" /></h2>
                    </g:if>
                    <cl:formattedText>${fieldValue(bean: instance, field: "pubDescription")}</cl:formattedText>
                    <cl:formattedText>${fieldValue(bean: instance, field: "techDescription")}</cl:formattedText>
                    <cl:formattedText>${fieldValue(bean: instance, field: "focus")}</cl:formattedText>
                    <cl:dataResourceContribution resourceType="${instance.resourceType}" status="${instance.status}" tag="p"/>

                    <g:if test="${instance.contentTypes}">
                        <h2><g:message code="public.sdr.content.label02" /></h2>
                        <cl:contentTypes types="${instance.contentTypes}"/>
                    </g:if>
                    <h2><g:message code="public.sdr.content.label03" /></h2>
                    <g:if test="${instance.citation}">
                        <cl:formattedText>${fieldValue(bean: instance, field: "citation")}</cl:formattedText>
                    </g:if>
                    <g:else>
                        <p><g:message code="public.sdr.content.des01" />.</p>
                    </g:else>

                    <g:if test="${instance.rights}">
                        <h2><g:message code="public.sdr.content.label04" /></h2>
                        <cl:formattedText>${fieldValue(bean: instance, field: "rights")}</cl:formattedText>
                    </g:if>

                    <g:if test="${instance.dataGeneralizations}">
                        <h2><g:message code="public.sdr.content.label05" /></h2>
                        <cl:formattedText>${fieldValue(bean: instance, field: "dataGeneralizations")}</cl:formattedText>
                    </g:if>

                    <g:if test="${instance.informationWithheld}">
                        <h2><g:message code="public.sdr.content.label06" /></h2>
                        <cl:formattedText>${fieldValue(bean: instance, field: "informationWithheld")}</cl:formattedText>
                    </g:if>

                    <g:if test="${instance.downloadLimit}">
                        <h2><g:message code="public.sdr.content.label07" /></h2>

                        <p><g:message code="public.sdr.content.des02" /> ${fieldValue(bean: instance, field: "downloadLimit")} <g:message code="public.sdr.content.des03" />.</p>
                    </g:if>

                    <div id="pagesContributed"></div>

                    <g:if test="${instance.resourceType == 'website' && (instance.lastChecked || instance.dataCurrency)}">
                        <h2><g:message code="public.sdr.content.label08" /></h2>

                        <p><cl:lastChecked date="${instance.lastChecked}"/>
                            <cl:dataCurrency date="${instance.dataCurrency}"/></p>
                    </g:if>

                    <g:if test="${!grailsApplication.config.disableLoggerLinks.toBoolean() && (instance.resourceType == 'website' || instance.resourceType == 'records')}">
                        <div id='usage-stats'>
                            <h2><g:message code="public.sdr.usagestats.labe" /></h2>

                            <div id='usage'>
                                <p><g:message code="public.usage.des" />...</p>
                            </div>
                            <g:if test="${instance.resourceType == 'website'}">
                                <div id="usage-visualization" style="width: 600px; height: 200px;"></div>
                            </g:if>
                        </div>
                    </g:if>
                    <cl:lastUpdated date="${instance.lastUpdated}"/>
                </div><!--close column-one-->
                <div class="col-md-4">
                    <g:if test="${dp?.logoRef?.file}">
                        <g:link action="show" id="${dp.uid}">
                            <img class="institutionImage"
                                 src='${resource(absolute: "true", dir: "data/dataProvider/", file: fieldValue(bean: dp, field: 'logoRef.file'))}'/>
                        </g:link>
                    </g:if>
                    <g:elseif test="${instance?.logoRef?.file}">
                        <img class="institutionImage"
                             src='${resource(absolute: "true", dir: "data/dataResource/", file: fieldValue(bean: instance, field: 'logoRef.file'))}'/>
                    </g:elseif>

                    <g:if test="${fieldValue(bean: instance, field: 'imageRef') && fieldValue(bean: instance, field: 'imageRef.file')}">
                        <section>
                            <img alt="${fieldValue(bean: instance, field: "imageRef.file")}"
                                 src="${resource(absolute: "true", dir: "data/dataResource/", file: instance.imageRef.file)}"/>
                            <cl:formattedText
                                    pClass="caption">${fieldValue(bean: instance, field: "imageRef.caption")}</cl:formattedText>
                            <cl:valueOrOtherwise value="${instance.imageRef?.attribution}"><p
                                    class="caption">${fieldValue(bean: instance, field: "imageRef.attribution")}</p></cl:valueOrOtherwise>
                            <cl:valueOrOtherwise value="${instance.imageRef?.copyright}"><p
                                    class="caption">${fieldValue(bean: instance, field: "imageRef.copyright")}</p></cl:valueOrOtherwise>
                        </section>
                    </g:if>
                    <g:if test="${instance.isVerified()}">
                        <section class="public-metadata">
                        <h5>
                            <g:message code="public.verified" default="Verified dataset"/>
                            <i class="fa fa-check-circle tooltips" style="color:green;"></i>
                        </h5>
                        </section>
                    </g:if>

                    <g:if test="${instance.gbifDoi}">
                        <section class="public-metadata">
                            <h4><g:message code="public.citations" default="Citations" /></h4>
                            <div class="btn-group-vertical">
                            <a class="btn btn-default" href="https://${instance.gbifDoi.replaceAll('doi:', 'doi.org/')}">
                                <i class="glyphicon glyphicon-info-sign"> </i>
                                ${instance.gbifDoi}
                            </a>
                            <g:if test="${instance.gbifRegistryKey}">
                                <citations:gbifLink gbifRegistryKey="${instance.gbifRegistryKey}"/>
                            </g:if>
                            </div>
                        </section>
                    </g:if>

                    <g:if test="${instance.licenseType}">
                        <section class="public-metadata">
                        <h4><g:message code="public.license" default="Licence" /></h4>
                        <p><cl:displayLicenseType type="${instance.licenseType}" version="${instance.licenseVersion}"/></p>
                        </section>
                    </g:if>



                    <!-- use parent location if the collection is blank -->
                    <g:set var="address" value="${instance.address}"/>
                    <g:if test="${address == null || address.isEmpty()}">
                        <g:if test="${instance.dataProvider}">
                            <g:set var="address" value="${instance.dataProvider?.address}"/>
                        </g:if>
                    </g:if>

                    <g:if test="${address != null && !address?.isEmpty()}">
                        <section class="public-metadata">
                            <h4><g:message code="public.location" /></h4>

                            <g:if test="${!address?.isEmpty()}">
                                <p>
                                    <cl:valueOrOtherwise value="${address?.street}">${address?.street}<br/></cl:valueOrOtherwise>
                                    <cl:valueOrOtherwise value="${address?.city}">${address?.city}<br/></cl:valueOrOtherwise>
                                    <cl:valueOrOtherwise value="${address?.state}">${address?.state}</cl:valueOrOtherwise>
                                    <cl:valueOrOtherwise value="${address?.postcode}">${address?.postcode}<br/></cl:valueOrOtherwise>
                                    <cl:valueOrOtherwise value="${address?.country}">${address?.country}<br/></cl:valueOrOtherwise>
                                </p>
                            </g:if>

                            <g:if test="${instance.email}"><cl:emailLink>${fieldValue(bean: instance, field: "email")}</cl:emailLink><br/></g:if>
                            <cl:ifNotBlank value='${fieldValue(bean: instance, field: "phone")}'/>
                        </section>
                    </g:if>

                    <!-- contacts -->
                        <g:if test="${instance.makeContactPublic}">
                            %{-- added so that contact visibility on website is on data resource level --}%
                            <g:set var="contacts" value="${instance.getContacts()}"/>
                        </g:if>
                        <g:else>
                            <g:set var="contacts" value="${instance.getPublicContactsPrimaryFirst()}"/>
                            <g:if test="${!contacts}">
                                <g:set var="contacts" value="${instance.dataProvider?.getContactsPrimaryFirst()}"/>
                            </g:if>
                        </g:else>
                        <g:render template="/plugins/collectory-1.9.2-SNAPSHOT/grails-app/views/public/contacts" bean="${contacts}"/>

                    <!-- web site -->
                        <g:if test="${instance.resourceType == 'species-list'}">
                            <section class="'public-metadata">
                                <h4><g:message code="public.sdr.content.label12" /></h4>
                                <div class="webSite">
                                    <a class='external_icon' target="_blank"
                                       href="${grailsApplication.config.speciesListToolUrl}${instance.uid}"><g:message code="public.sdr.content.link03" /></a>
                                </div>
                            </section>
                        </g:if>
                        <g:elseif test="${instance.websiteUrl}">
                            <section class="public-metadata">
                                <h4><g:message code="public.website" /></h4>
                                <div class="webSite">
                                    <a class='external_icon' target="_blank"
                                       href="${instance.websiteUrl}"><g:message code="public.sdr.content.link04" /></a>
                                </div>
                            </section>
                        </g:elseif>



                        <!-- attribution -->
                            <g:set var='attribs' value='${instance.getAttributionList()}'/>
                            <g:if test="${attribs.size() > 0}">
                                <section class="public-metadata" id="infoSourceList">
                                    <h4><g:message code="public.sdr.infosourcelist.title" /></h4>
                                    <ul>
                                        <g:each var="a" in="${attribs}">
                                            <li><a href="${a.url}" class="external" target="_blank">${a.name}</a></li>
                                        </g:each>
                                    </ul>
                                </section>
                            </g:if>

                         <!-- external identifiers -->
                            <g:render template="/plugins/collectory-1.9.2-SNAPSHOT/grails-app/views/public/externalIdentifiers" model="[instance:instance]"/>
                        </div>
                </div>

            <div id="descTab" class="tab-pane row">
                <g:if test="${instance.geographicDescription}">
                    <h2><g:message code="public.geographicDescription" default="Purpose"/></h2>
                    <cl:formattedText>${fieldValue(bean: instance, field: "geographicDescription")}</cl:formattedText>
                </g:if>

                <g:if test="${instance.purpose}">
                    <h2><g:message code="public.purpose" default="Purpose"/></h2>
                    <cl:formattedText>${fieldValue(bean: instance, field: "purpose")}</cl:formattedText>
                </g:if>

                <g:if test="${instance.qualityControlDescription}">
                    <h2><g:message code="public.qualityControlDescription" /></h2>
                    <cl:formattedText>${fieldValue(bean: instance, field: "qualityControlDescription")}</cl:formattedText>
                </g:if>

                <g:if test="${instance.methodStepDescription}">
                    <h2><g:message code="public.methodStepDescription" /></h2>
                    <cl:formattedText>${fieldValue(bean: instance, field: "methodStepDescription")}</cl:formattedText>
                </g:if>
                <g:if test="${instance.beginDate}">
                    <section class="public-metadata">
                        <h2><g:message code="public.temporal" default="Temporal scope" /></h2>
                        <p>${instance.beginDate}
                        <g:if test="${instance.endDate}">
                            - ${instance.endDate}
                        </g:if>
                        </p>
                    </section>
                </g:if>
            </div>

            <div id="statTab"  class="tab-pane row">

                <g:if test="${instance.resourceType == 'records'}">
                    <h2><g:message code="public.sdr.content.label09" /></h2>

                    <div>
                        <p><span
                                id="numBiocacheRecords"><g:message code="public.sdr.content.des04" /></span>
                            <g:message code="public.sdr.content.des05" args="[orgNameLong]" />.

                            <cl:lastChecked date="${instance.lastChecked}"/>
                            <cl:dataCurrency date="${instance.dataCurrency}"/>
                        </p>
                        <cl:recordsLink
                                collection="${instance}"><g:message code="public.sdr.content.link01" /> ${instance.name} <g:message code="public.sdr.content.link02" />.</cl:recordsLink>
                        <cl:downloadPublicArchive uid="${instance.uid}" available="${instance.publicArchiveAvailable}"/>
                    </div>
                </g:if>
                <g:if test="${instance.resourceType == 'records'}">
                    <div id="recordsBreakdown" class="section vertical-charts">
                        <g:if test="${!grailsApplication.config.disableOverviewMap}">
                            <h3><g:message code="public.sdr.content.label10" /></h3>
                            <cl:recordsMapDirect uid="${instance.uid}"/>
                        </g:if>
                        <div id="tree" class="well"></div>
                        <div id="charts"></div>
                    </div>
                </g:if>
            </div>
        </div>
    </section>
</div>

<r:script type="text/javascript">
  // stats
  if(loadLoggerStats){
      if (${instance.resourceType == 'website'}) {
          loadDownloadStats("${grailsApplication.config.loggerURL}", "${instance.uid}","${instance.name}", "2000");
      } else if (${instance.resourceType == 'records'}) {
          loadDownloadStats("${grailsApplication.config.loggerURL}", "${instance.uid}","${instance.name}", "1002");
      }
  }
</r:script>
<g:render template="/plugins/collectory-1.9.2-SNAPSHOT/grails-app/views/public/taxonTree" model="[facet:'data_resource_uid', instance: instance]" />
<g:render template="/plugins/collectory-1.9.2-SNAPSHOT/grails-app/views/public/charts" model="[facet:'data_resource_uid', instance: instance]" />
</body>
</html>
