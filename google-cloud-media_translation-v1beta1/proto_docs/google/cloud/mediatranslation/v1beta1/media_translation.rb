# frozen_string_literal: true

# Copyright 2020 Google LLC
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

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!


module Google
  module Cloud
    module MediaTranslation
      module V1beta1
        # Provides information to the speech translation that specifies how to process
        # the request.
        # @!attribute [rw] audio_encoding
        #   @return [::String]
        #     Required. Encoding of audio data.
        #     Supported formats:
        #
        #     - `linear16`
        #
        #       Uncompressed 16-bit signed little-endian samples (Linear PCM).
        # @!attribute [rw] source_language_code
        #   @return [::String]
        #     Required. Source language code (BCP-47) of the input audio.
        # @!attribute [rw] alternative_source_language_codes
        #   @return [::Array<::String>]
        #     Optional. A list of up to 3 additional language codes (BCP-47), listing possible
        #     alternative languages of the supplied audio. If alternative source
        #     languages are listed, speech translation result will translate in the most
        #     likely language detected including the main source_language_code. The
        #     translated result will include the language code of the language detected
        #     in the audio.
        # @!attribute [rw] target_language_code
        #   @return [::String]
        #     Required. Target language code (BCP-47) of the output.
        # @!attribute [rw] sample_rate_hertz
        #   @return [::Integer]
        #     Optional. Sample rate in Hertz of the audio data. Valid values are:
        #     8000-48000. 16000 is optimal. For best results, set the sampling rate of
        #     the audio source to 16000 Hz. If that's not possible, use the native sample
        #     rate of the audio source (instead of re-sampling). This field can only be
        #     omitted for `FLAC` and `WAV` audio files.
        # @!attribute [rw] model
        #   @return [::String]
        #     Optional.
        class TranslateSpeechConfig
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Config used for streaming translation.
        # @!attribute [rw] audio_config
        #   @return [::Google::Cloud::MediaTranslation::V1beta1::TranslateSpeechConfig]
        #     Required. The common config for all the following audio contents.
        # @!attribute [rw] single_utterance
        #   @return [::Boolean]
        #     Optional. If `false` or omitted, the system performs
        #     continuous translation (continuing to wait for and process audio even if
        #     the user pauses speaking) until the client closes the input stream (gRPC
        #     API) or until the maximum time limit has been reached. May return multiple
        #     `StreamingTranslateSpeechResult`s with the `is_final` flag set to `true`.
        #
        #     If `true`, the speech translator will detect a single spoken utterance.
        #     When it detects that the user has paused or stopped speaking, it will
        #     return an `END_OF_SINGLE_UTTERANCE` event and cease translation.
        #     When the client receives 'END_OF_SINGLE_UTTERANCE' event, the client should
        #     stop sending the requests. However, clients should keep receiving remaining
        #     responses until the stream is terminated. To construct the complete
        #     sentence in a streaming way, one should override (if 'is_final' of previous
        #     response is false), or append (if 'is_final' of previous response is true).
        class StreamingTranslateSpeechConfig
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # The top-level message sent by the client for the `StreamingTranslateSpeech`
        # method. Multiple `StreamingTranslateSpeechRequest` messages are sent. The
        # first message must contain a `streaming_config` message and must not contain
        # `audio_content` data. All subsequent messages must contain `audio_content`
        # data and must not contain a `streaming_config` message.
        # @!attribute [rw] streaming_config
        #   @return [::Google::Cloud::MediaTranslation::V1beta1::StreamingTranslateSpeechConfig]
        #     Provides information to the recognizer that specifies how to process the
        #     request. The first `StreamingTranslateSpeechRequest` message must contain
        #     a `streaming_config` message.
        # @!attribute [rw] audio_content
        #   @return [::String]
        #     The audio data to be translated. Sequential chunks of audio data are sent
        #     in sequential `StreamingTranslateSpeechRequest` messages. The first
        #     `StreamingTranslateSpeechRequest` message must not contain
        #     `audio_content` data and all subsequent `StreamingTranslateSpeechRequest`
        #     messages must contain `audio_content` data. The audio bytes must be
        #     encoded as specified in `StreamingTranslateSpeechConfig`. Note: as with
        #     all bytes fields, protobuffers use a pure binary representation (not
        #     base64).
        class StreamingTranslateSpeechRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # A streaming speech translation result corresponding to a portion of the audio
        # that is currently being processed.
        # @!attribute [rw] text_translation_result
        #   @return [::Google::Cloud::MediaTranslation::V1beta1::StreamingTranslateSpeechResult::TextTranslationResult]
        #     Text translation result.
        # @!attribute [r] recognition_result
        #   @return [::String]
        #     Output only. The debug only recognition result in original language. This field is debug
        #     only and will be set to empty string if not available.
        #     This is implementation detail and will not be backward compatible.
        #
        #     Still need to decide whether to expose this field by default.
        class StreamingTranslateSpeechResult
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # Text translation result.
          # @!attribute [r] translation
          #   @return [::String]
          #     Output only. The translated sentence.
          # @!attribute [r] is_final
          #   @return [::Boolean]
          #     Output only. If `false`, this `StreamingTranslateSpeechResult` represents
          #     an interim result that may change. If `true`, this is the final time the
          #     translation service will return this particular
          #     `StreamingTranslateSpeechResult`, the streaming translator will not
          #     return any further hypotheses for this portion of the transcript and
          #     corresponding audio.
          # @!attribute [r] detected_source_language_code
          #   @return [::String]
          #     Output only. The source language code (BCP-47) detected in the audio. Speech
          #     translation result will translate in the most likely language detected
          #     including the alternative source languages and main source_language_code.
          class TextTranslationResult
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end
        end

        # A streaming speech translation response corresponding to a portion of
        # the audio currently processed.
        # @!attribute [r] error
        #   @return [::Google::Rpc::Status]
        #     Output only. If set, returns a {::Google::Rpc::Status google.rpc.Status} message that
        #     specifies the error for the operation.
        # @!attribute [r] result
        #   @return [::Google::Cloud::MediaTranslation::V1beta1::StreamingTranslateSpeechResult]
        #     Output only. The translation result that is currently being processed (is_final could be
        #     true or false).
        # @!attribute [r] speech_event_type
        #   @return [::Google::Cloud::MediaTranslation::V1beta1::StreamingTranslateSpeechResponse::SpeechEventType]
        #     Output only. Indicates the type of speech event.
        class StreamingTranslateSpeechResponse
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # Indicates the type of speech event.
          module SpeechEventType
            # No speech event specified.
            SPEECH_EVENT_TYPE_UNSPECIFIED = 0

            # This event indicates that the server has detected the end of the user's
            # speech utterance and expects no additional speech. Therefore, the server
            # will not process additional audio (although it may subsequently return
            # additional results). When the client receives 'END_OF_SINGLE_UTTERANCE'
            # event, the client should stop sending the requests. However, clients
            # should keep receiving remaining responses until the stream is terminated.
            # To construct the complete sentence in a streaming way, one should
            # override (if 'is_final' of previous response is false), or append (if
            # 'is_final' of previous response is true). This event is only sent if
            # `single_utterance` was set to `true`, and is not used otherwise.
            END_OF_SINGLE_UTTERANCE = 1
          end
        end
      end
    end
  end
end
