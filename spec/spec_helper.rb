$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'devry'
require 'rspec'
require 'fakeweb'

FIXTURE_PATH = File.expand_path(File.dirname(__FILE__) + "/fixtures")

FakeWeb.allow_net_connect = false
FakeWeb.register_uri(:get, "https://devryuniversity-devry.icims.com/jobs/search?pr=1", :response => FIXTURE_PATH + "/index.html")
FakeWeb.register_uri(:get, "https://devryuniversity-devry.icims.com/jobs/search?pr=2", :response => FIXTURE_PATH + "/page_2.html")
FakeWeb.register_uri(:get, "https://devryuniversity-devry.icims.com/jobs/13545/job",   :response => FIXTURE_PATH + "/job.html")
