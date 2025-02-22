# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


module Google
  module Monitoring
    module V3
      # An internal checker allows Uptime checks to run on private/internal GCP
      # resources.
      # @!attribute [rw] name
      #   @return [String]
      #     A unique resource name for this InternalChecker. The format is:
      #
      #       `projects/[PROJECT_ID]/internalCheckers/[INTERNAL_CHECKER_ID]`.
      #
      #     `[PROJECT_ID]` is the Stackdriver Workspace project for the
      #     Uptime check config associated with the internal checker.
      # @!attribute [rw] display_name
      #   @return [String]
      #     The checker's human-readable name. The display name
      #     should be unique within a Stackdriver Workspace in order to make it easier
      #     to identify; however, uniqueness is not enforced.
      # @!attribute [rw] network
      #   @return [String]
      #     The [GCP VPC network](https://cloud.google.com/vpc/docs/vpc) where the
      #     internal resource lives (ex: "default").
      # @!attribute [rw] gcp_zone
      #   @return [String]
      #     The GCP zone the Uptime check should egress from. Only respected for
      #     internal Uptime checks, where internal_network is specified.
      # @!attribute [rw] peer_project_id
      #   @return [String]
      #     The GCP project ID where the internal checker lives. Not necessary
      #     the same as the Workspace project.
      # @!attribute [rw] state
      #   @return [Google::Monitoring::V3::InternalChecker::State]
      #     The current operational state of the internal checker.
      class InternalChecker
        # Operational states for an internal checker.
        module State
          # An internal checker should never be in the unspecified state.
          UNSPECIFIED = 0

          # The checker is being created, provisioned, and configured. A checker in
          # this state can be returned by `ListInternalCheckers` or
          # `GetInternalChecker`, as well as by examining the [long running
          # Operation](https://cloud.google.com/apis/design/design_patterns#long_running_operations)
          # that created it.
          CREATING = 1

          # The checker is running and available for use. A checker in this state
          # can be returned by `ListInternalCheckers` or `GetInternalChecker` as
          # well as by examining the [long running
          # Operation](https://cloud.google.com/apis/design/design_patterns#long_running_operations)
          # that created it.
          # If a checker is being torn down, it is neither visible nor usable, so
          # there is no "deleting" or "down" state.
          RUNNING = 2
        end
      end

      # This message configures which resources and services to monitor for
      # availability.
      # @!attribute [rw] name
      #   @return [String]
      #     A unique resource name for this Uptime check configuration. The format is:
      #
      #       `projects/[PROJECT_ID]/uptimeCheckConfigs/[UPTIME_CHECK_ID]`.
      #
      #     This field should be omitted when creating the Uptime check configuration;
      #     on create, the resource name is assigned by the server and included in the
      #     response.
      # @!attribute [rw] display_name
      #   @return [String]
      #     A human-friendly name for the Uptime check configuration. The display name
      #     should be unique within a Stackdriver Workspace in order to make it easier
      #     to identify; however, uniqueness is not enforced. Required.
      # @!attribute [rw] monitored_resource
      #   @return [Google::Api::MonitoredResource]
      #     The [monitored
      #     resource](https://cloud.google.com/monitoring/api/resources) associated
      #     with the configuration.
      #     The following monitored resource types are supported for Uptime checks:
      #       `uptime_url`,
      #       `gce_instance`,
      #       `gae_app`,
      #       `aws_ec2_instance`,
      #       `aws_elb_load_balancer`
      # @!attribute [rw] resource_group
      #   @return [Google::Monitoring::V3::UptimeCheckConfig::ResourceGroup]
      #     The group resource associated with the configuration.
      # @!attribute [rw] http_check
      #   @return [Google::Monitoring::V3::UptimeCheckConfig::HttpCheck]
      #     Contains information needed to make an HTTP or HTTPS check.
      # @!attribute [rw] tcp_check
      #   @return [Google::Monitoring::V3::UptimeCheckConfig::TcpCheck]
      #     Contains information needed to make a TCP check.
      # @!attribute [rw] period
      #   @return [Google::Protobuf::Duration]
      #     How often, in seconds, the Uptime check is performed.
      #     Currently, the only supported values are `60s` (1 minute), `300s`
      #     (5 minutes), `600s` (10 minutes), and `900s` (15 minutes). Optional,
      #     defaults to `60s`.
      # @!attribute [rw] timeout
      #   @return [Google::Protobuf::Duration]
      #     The maximum amount of time to wait for the request to complete (must be
      #     between 1 and 60 seconds). Required.
      # @!attribute [rw] content_matchers
      #   @return [Array<Google::Monitoring::V3::UptimeCheckConfig::ContentMatcher>]
      #     The content that is expected to appear in the data returned by the target
      #     server against which the check is run.  Currently, only the first entry
      #     in the `content_matchers` list is supported, and additional entries will
      #     be ignored. This field is optional and should only be specified if a
      #     content match is required as part of the/ Uptime check.
      # @!attribute [rw] selected_regions
      #   @return [Array<Google::Monitoring::V3::UptimeCheckRegion>]
      #     The list of regions from which the check will be run.
      #     Some regions contain one location, and others contain more than one.
      #     If this field is specified, enough regions must be provided to include a
      #     minimum of 3 locations.  Not specifying this field will result in Uptime
      #     checks running from all available regions.
      # @!attribute [rw] internal_checkers
      #   @return [Array<Google::Monitoring::V3::InternalChecker>]
      #     The internal checkers that this check will egress from. If `is_internal` is
      #     `true` and this list is empty, the check will egress from all the
      #     InternalCheckers configured for the project that owns this
      #     `UptimeCheckConfig`.
      class UptimeCheckConfig
        # The resource submessage for group checks. It can be used instead of a
        # monitored resource, when multiple resources are being monitored.
        # @!attribute [rw] group_id
        #   @return [String]
        #     The group of resources being monitored. Should be only the `[GROUP_ID]`,
        #     and not the full-path `projects/[PROJECT_ID]/groups/[GROUP_ID]`.
        # @!attribute [rw] resource_type
        #   @return [Google::Monitoring::V3::GroupResourceType]
        #     The resource type of the group members.
        class ResourceGroup; end

        # Information involved in an HTTP/HTTPS Uptime check request.
        # @!attribute [rw] use_ssl
        #   @return [true, false]
        #     If `true`, use HTTPS instead of HTTP to run the check.
        # @!attribute [rw] path
        #   @return [String]
        #     Optional (defaults to "/"). The path to the page against which to run
        #     the check. Will be combined with the `host` (specified within the
        #     `monitored_resource`) and `port` to construct the full URL. If the
        #     provided path does not begin with "/", a "/" will be prepended
        #     automatically.
        # @!attribute [rw] port
        #   @return [Integer]
        #     Optional (defaults to 80 when `use_ssl` is `false`, and 443 when
        #     `use_ssl` is `true`). The TCP port on the HTTP server against which to
        #     run the check. Will be combined with host (specified within the
        #     `monitored_resource`) and `path` to construct the full URL.
        # @!attribute [rw] auth_info
        #   @return [Google::Monitoring::V3::UptimeCheckConfig::HttpCheck::BasicAuthentication]
        #     The authentication information. Optional when creating an HTTP check;
        #     defaults to empty.
        # @!attribute [rw] mask_headers
        #   @return [true, false]
        #     Boolean specifiying whether to encrypt the header information.
        #     Encryption should be specified for any headers related to authentication
        #     that you do not wish to be seen when retrieving the configuration. The
        #     server will be responsible for encrypting the headers.
        #     On Get/List calls, if `mask_headers` is set to `true` then the headers
        #     will be obscured with `******.`
        # @!attribute [rw] headers
        #   @return [Hash{String => String}]
        #     The list of headers to send as part of the Uptime check request.
        #     If two headers have the same key and different values, they should
        #     be entered as a single header, with the value being a comma-separated
        #     list of all the desired values as described at
        #     https://www.w3.org/Protocols/rfc2616/rfc2616.txt (page 31).
        #     Entering two separate headers with the same key in a Create call will
        #     cause the first to be overwritten by the second.
        #     The maximum number of headers allowed is 100.
        # @!attribute [rw] validate_ssl
        #   @return [true, false]
        #     Boolean specifying whether to include SSL certificate validation as a
        #     part of the Uptime check. Only applies to checks where
        #     `monitored_resource` is set to `uptime_url`. If `use_ssl` is `false`,
        #     setting `validate_ssl` to `true` has no effect.
        class HttpCheck
          # The authentication parameters to provide to the specified resource or
          # URL that requires a username and password. Currently, only
          # [Basic HTTP authentication](https://tools.ietf.org/html/rfc7617) is
          # supported in Uptime checks.
          # @!attribute [rw] username
          #   @return [String]
          #     The username to use when authenticating with the HTTP server.
          # @!attribute [rw] password
          #   @return [String]
          #     The password to use when authenticating with the HTTP server.
          class BasicAuthentication; end
        end

        # Information required for a TCP Uptime check request.
        # @!attribute [rw] port
        #   @return [Integer]
        #     The TCP port on the server against which to run the check. Will be
        #     combined with host (specified within the `monitored_resource`) to
        #     construct the full URL. Required.
        class TcpCheck; end

        # Used to perform string matching. It allows substring and regular
        # expressions, together with their negations.
        # @!attribute [rw] content
        #   @return [String]
        #     String or regex content to match (max 1024 bytes)
        # @!attribute [rw] matcher
        #   @return [Google::Monitoring::V3::UptimeCheckConfig::ContentMatcher::ContentMatcherOption]
        #     The type of content matcher that will be applied to the server output,
        #     compared to the `content` string when the check is run.
        class ContentMatcher
          # Options to perform content matching.
          module ContentMatcherOption
            # No content matcher type specified (maintained for backward
            # compatibility, but deprecated for future use).
            # Treated as `CONTAINS_STRING`.
            CONTENT_MATCHER_OPTION_UNSPECIFIED = 0

            # Selects substring matching (there is a match if the output contains
            # the `content` string).  This is the default value for checks without
            # a `matcher` option, or where the value of `matcher` is
            # `CONTENT_MATCHER_OPTION_UNSPECIFIED`.
            CONTAINS_STRING = 1

            # Selects negation of substring matching (there is a match if the output
            # does NOT contain the `content` string).
            NOT_CONTAINS_STRING = 2

            # Selects regular expression matching (there is a match of the output
            # matches the regular expression specified in the `content` string).
            MATCHES_REGEX = 3

            # Selects negation of regular expression matching (there is a match if
            # the output does NOT match the regular expression specified in the
            # `content` string).
            NOT_MATCHES_REGEX = 4
          end
        end
      end

      # Contains the region, location, and list of IP
      # addresses where checkers in the location run from.
      # @!attribute [rw] region
      #   @return [Google::Monitoring::V3::UptimeCheckRegion]
      #     A broad region category in which the IP address is located.
      # @!attribute [rw] location
      #   @return [String]
      #     A more specific location within the region that typically encodes
      #     a particular city/town/metro (and its containing state/province or country)
      #     within the broader umbrella region category.
      # @!attribute [rw] ip_address
      #   @return [String]
      #     The IP address from which the Uptime check originates. This is a fully
      #     specified IP address (not an IP address range). Most IP addresses, as of
      #     this publication, are in IPv4 format; however, one should not rely on the
      #     IP addresses being in IPv4 format indefinitely, and should support
      #     interpreting this field in either IPv4 or IPv6 format.
      class UptimeCheckIp; end

      # The supported resource types that can be used as values of
      # `group_resource.resource_type`.
      # `INSTANCE` includes `gce_instance` and `aws_ec2_instance` resource types.
      # The resource types `gae_app` and `uptime_url` are not valid here because
      # group checks on App Engine modules and URLs are not allowed.
      module GroupResourceType
        # Default value (not valid).
        RESOURCE_TYPE_UNSPECIFIED = 0

        # A group of instances from Google Cloud Platform (GCP) or
        # Amazon Web Services (AWS).
        INSTANCE = 1

        # A group of Amazon ELB load balancers.
        AWS_ELB_LOAD_BALANCER = 2
      end

      # The regions from which an Uptime check can be run.
      module UptimeCheckRegion
        # Default value if no region is specified. Will result in Uptime checks
        # running from all regions.
        REGION_UNSPECIFIED = 0

        # Allows checks to run from locations within the United States of America.
        USA = 1

        # Allows checks to run from locations within the continent of Europe.
        EUROPE = 2

        # Allows checks to run from locations within the continent of South
        # America.
        SOUTH_AMERICA = 3

        # Allows checks to run from locations within the Asia Pacific area (ex:
        # Singapore).
        ASIA_PACIFIC = 4
      end
    end
  end
end