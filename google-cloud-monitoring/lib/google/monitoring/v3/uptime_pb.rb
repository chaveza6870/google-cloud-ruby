# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/monitoring/v3/uptime.proto


require 'google/protobuf'

require 'google/api/monitored_resource_pb'
require 'google/protobuf/duration_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.monitoring.v3.InternalChecker" do
    optional :name, :string, 1
    optional :display_name, :string, 2
    optional :network, :string, 3
    optional :gcp_zone, :string, 4
    optional :peer_project_id, :string, 6
    optional :state, :enum, 7, "google.monitoring.v3.InternalChecker.State"
  end
  add_enum "google.monitoring.v3.InternalChecker.State" do
    value :UNSPECIFIED, 0
    value :CREATING, 1
    value :RUNNING, 2
  end
  add_message "google.monitoring.v3.UptimeCheckConfig" do
    optional :name, :string, 1
    optional :display_name, :string, 2
    optional :period, :message, 7, "google.protobuf.Duration"
    optional :timeout, :message, 8, "google.protobuf.Duration"
    repeated :content_matchers, :message, 9, "google.monitoring.v3.UptimeCheckConfig.ContentMatcher"
    repeated :selected_regions, :enum, 10, "google.monitoring.v3.UptimeCheckRegion"
    optional :is_internal, :bool, 15
    repeated :internal_checkers, :message, 14, "google.monitoring.v3.InternalChecker"
    oneof :resource do
      optional :monitored_resource, :message, 3, "google.api.MonitoredResource"
      optional :resource_group, :message, 4, "google.monitoring.v3.UptimeCheckConfig.ResourceGroup"
    end
    oneof :check_request_type do
      optional :http_check, :message, 5, "google.monitoring.v3.UptimeCheckConfig.HttpCheck"
      optional :tcp_check, :message, 6, "google.monitoring.v3.UptimeCheckConfig.TcpCheck"
    end
  end
  add_message "google.monitoring.v3.UptimeCheckConfig.ResourceGroup" do
    optional :group_id, :string, 1
    optional :resource_type, :enum, 2, "google.monitoring.v3.GroupResourceType"
  end
  add_message "google.monitoring.v3.UptimeCheckConfig.HttpCheck" do
    optional :use_ssl, :bool, 1
    optional :path, :string, 2
    optional :port, :int32, 3
    optional :auth_info, :message, 4, "google.monitoring.v3.UptimeCheckConfig.HttpCheck.BasicAuthentication"
    optional :mask_headers, :bool, 5
    map :headers, :string, :string, 6
    optional :validate_ssl, :bool, 7
  end
  add_message "google.monitoring.v3.UptimeCheckConfig.HttpCheck.BasicAuthentication" do
    optional :username, :string, 1
    optional :password, :string, 2
  end
  add_message "google.monitoring.v3.UptimeCheckConfig.TcpCheck" do
    optional :port, :int32, 1
  end
  add_message "google.monitoring.v3.UptimeCheckConfig.ContentMatcher" do
    optional :content, :string, 1
    optional :matcher, :enum, 2, "google.monitoring.v3.UptimeCheckConfig.ContentMatcher.ContentMatcherOption"
  end
  add_enum "google.monitoring.v3.UptimeCheckConfig.ContentMatcher.ContentMatcherOption" do
    value :CONTENT_MATCHER_OPTION_UNSPECIFIED, 0
    value :CONTAINS_STRING, 1
    value :NOT_CONTAINS_STRING, 2
    value :MATCHES_REGEX, 3
    value :NOT_MATCHES_REGEX, 4
  end
  add_message "google.monitoring.v3.UptimeCheckIp" do
    optional :region, :enum, 1, "google.monitoring.v3.UptimeCheckRegion"
    optional :location, :string, 2
    optional :ip_address, :string, 3
  end
  add_enum "google.monitoring.v3.UptimeCheckRegion" do
    value :REGION_UNSPECIFIED, 0
    value :USA, 1
    value :EUROPE, 2
    value :SOUTH_AMERICA, 3
    value :ASIA_PACIFIC, 4
  end
  add_enum "google.monitoring.v3.GroupResourceType" do
    value :RESOURCE_TYPE_UNSPECIFIED, 0
    value :INSTANCE, 1
    value :AWS_ELB_LOAD_BALANCER, 2
  end
end

module Google
  module Monitoring
    module V3
      InternalChecker = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.monitoring.v3.InternalChecker").msgclass
      InternalChecker::State = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.monitoring.v3.InternalChecker.State").enummodule
      UptimeCheckConfig = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.monitoring.v3.UptimeCheckConfig").msgclass
      UptimeCheckConfig::ResourceGroup = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.monitoring.v3.UptimeCheckConfig.ResourceGroup").msgclass
      UptimeCheckConfig::HttpCheck = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.monitoring.v3.UptimeCheckConfig.HttpCheck").msgclass
      UptimeCheckConfig::HttpCheck::BasicAuthentication = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.monitoring.v3.UptimeCheckConfig.HttpCheck.BasicAuthentication").msgclass
      UptimeCheckConfig::TcpCheck = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.monitoring.v3.UptimeCheckConfig.TcpCheck").msgclass
      UptimeCheckConfig::ContentMatcher = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.monitoring.v3.UptimeCheckConfig.ContentMatcher").msgclass
      UptimeCheckConfig::ContentMatcher::ContentMatcherOption = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.monitoring.v3.UptimeCheckConfig.ContentMatcher.ContentMatcherOption").enummodule
      UptimeCheckIp = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.monitoring.v3.UptimeCheckIp").msgclass
      UptimeCheckRegion = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.monitoring.v3.UptimeCheckRegion").enummodule
      GroupResourceType = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.monitoring.v3.GroupResourceType").enummodule
    end
  end
end
