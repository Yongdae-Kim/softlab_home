package com.jejuuniv.softlab.home



import grails.test.mixin.*
import spock.lang.*

@TestFor(AndroidReportController)
@Mock(AndroidReport)
class AndroidReportControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.androidReportInstanceList
            model.androidReportInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.androidReportInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def androidReport = new AndroidReport()
            androidReport.validate()
            controller.save(androidReport)

        then:"The create view is rendered again with the correct model"
            model.androidReportInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            androidReport = new AndroidReport(params)

            controller.save(androidReport)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/androidReport/show/1'
            controller.flash.message != null
            AndroidReport.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def androidReport = new AndroidReport(params)
            controller.show(androidReport)

        then:"A model is populated containing the domain instance"
            model.androidReportInstance == androidReport
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def androidReport = new AndroidReport(params)
            controller.edit(androidReport)

        then:"A model is populated containing the domain instance"
            model.androidReportInstance == androidReport
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/androidReport/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def androidReport = new AndroidReport()
            androidReport.validate()
            controller.update(androidReport)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.androidReportInstance == androidReport

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            androidReport = new AndroidReport(params).save(flush: true)
            controller.update(androidReport)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/androidReport/show/$androidReport.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/androidReport/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def androidReport = new AndroidReport(params).save(flush: true)

        then:"It exists"
            AndroidReport.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(androidReport)

        then:"The instance is deleted"
            AndroidReport.count() == 0
            response.redirectedUrl == '/androidReport/index'
            flash.message != null
    }
}
