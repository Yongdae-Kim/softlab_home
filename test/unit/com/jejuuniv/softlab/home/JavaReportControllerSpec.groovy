package com.jejuuniv.softlab.home



import grails.test.mixin.*
import spock.lang.*

@TestFor(JavaReportController)
@Mock(JavaReport)
class JavaReportControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.list()

        then:"The model is correct"
            !model.javaReportInstanceList
            model.javaReportInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.javaReportInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def javaReport = new JavaReport()
            javaReport.validate()
            controller.save(javaReport)

        then:"The create view is rendered again with the correct model"
            model.javaReportInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            javaReport = new JavaReport(params)

            controller.save(javaReport)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/javaReport/show/1'
            controller.flash.message != null
            JavaReport.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def javaReport = new JavaReport(params)
            controller.show(javaReport)

        then:"A model is populated containing the domain instance"
            model.javaReportInstance == javaReport
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def javaReport = new JavaReport(params)
            controller.edit(javaReport)

        then:"A model is populated containing the domain instance"
            model.javaReportInstance == javaReport
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/javaReport/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def javaReport = new JavaReport()
            javaReport.validate()
            controller.update(javaReport)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.javaReportInstance == javaReport

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            javaReport = new JavaReport(params).save(flush: true)
            controller.update(javaReport)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/javaReport/show/$javaReport.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/javaReport/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def javaReport = new JavaReport(params).save(flush: true)

        then:"It exists"
            JavaReport.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(javaReport)

        then:"The instance is deleted"
            JavaReport.count() == 0
            response.redirectedUrl == '/javaReport/index'
            flash.message != null
    }
}
