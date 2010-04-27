# -*- coding: utf-8 -*-
require 'spec/spec_helper'

describe Devry do

  describe Devry::Job do

    describe ".all" do

      before do
        @jobs = Devry::Job.all
      end

      it 'should return a list of jobs' do
        @jobs.size.should == 11
      end

    end

    describe "instance" do

      before do
        @jobs = Devry::Job.all
        @job  = @jobs.first
      end

      it 'should extract the id' do
        @job.id.should == "2010-13545"
      end

      it 'should extract the title' do
        @job.title.should == "Online Adjunct Faculty-Investment Fundamentals and Security Analysis"
      end

      it 'should extract the location' do
        @job.location.should == "US-CA-Fremont"
      end

      it 'should extract the country from location' do
        @job.country.should == "US"
      end

      it 'should extract the state from location' do
        @job.state.should == "CA"
      end

      it 'should extract the city from location' do
        @job.city.should == "Fremont"
      end

      it 'should extract the posted date' do
        @job.posted_date.should == Time.mktime(2010, 4, 27)
      end

      it 'should extract the url' do
        @job.url.should == "https://devryuniversity-devry.icims.com/jobs/13545/job"
      end

      it 'should extract the description' do
        @job.description.should == "The Faculty provides the educational focus of teaching (facilitating) in our academic courses, and service to the College, profession, and scholarly activities are integral aspects of this position.\n\nTo perform this job successfully, an individual must be able to perform each essential duty satisfactorily. The requirements listed below are representative of the knowledge, skill, and/or ability required. Reasonable accommodations may be made to enable individuals with disabilities to perform the essential functions. Develops strategies to teach the course for the entire semester or session, using DeVry Online curriculum guides and meeting the university's academic standards.Provides students with an approved syllabus that follows a template established by DeVry Online, and which includes the terminal course objectives. Organizes and prepares all course materials for facilitation.Utilizes appropriate educational technology to engage students and enhance learning. Connects students' current study to real-world applications, using lab and library assignments and linking coursework to previous/future study in related disciplines. Ensures that the content and level of material included on exams correspond to the course terminal objectives, that the material has been adequately addressed in the course, that concepts have been demonstrated, and that relevant homework has been reviewed. Provides multiple evaluative formats for students to demonstrate their knowledge and earn their grades in the course. Demonstrates consistency and fairness in the preparation and grading of exams, and provide timely feedback to students. Maintains students’ grade book, and completes final grades by the deadline.\n\nMaster's degree in Finance; Ph.D preferred. CPA, CFA or CFM is required.  Minimum of 3 years related industry and/or academic experience. Prior teaching experience is required. We are proud to be an EEO employer M/F/D/V. We maintain a drug-free workplace and perform pre-employment substance abuse testing. Thank you for applying for this outstanding opportunity today."
      end

    end

  end

end
