{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE DeriveAnyClass    #-}
{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE GADTs             #-}
{-# LANGUAGE TypeApplications  #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- | Generated by Haskell protocol buffer compiler. DO NOT EDIT!
module HstreamBroker where
import qualified Prelude as Hs
import qualified Proto3.Suite.Class as HsProtobuf
import qualified Proto3.Suite.DotProto as HsProtobuf
import qualified Proto3.Suite.JSONPB as HsJSONPB
import Proto3.Suite.JSONPB ((.=), (.:))
import qualified Proto3.Suite.Types as HsProtobuf
import qualified Proto3.Wire as HsProtobuf
import qualified Control.Applicative as Hs
import Control.Applicative ((<*>), (<|>), (<$>))
import qualified Control.DeepSeq as Hs
import qualified Control.Monad as Hs
import qualified Data.ByteString as Hs
import qualified Data.Coerce as Hs
import qualified Data.Int as Hs (Int16, Int32, Int64)
import qualified Data.List.NonEmpty as Hs (NonEmpty(..))
import qualified Data.Map as Hs (Map, mapKeysMonotonic)
import qualified Data.Proxy as Proxy
import qualified Data.String as Hs (fromString)
import qualified Data.Text.Lazy as Hs (Text)
import qualified Data.Vector as Hs (Vector)
import qualified Data.Word as Hs (Word16, Word32, Word64)
import qualified GHC.Enum as Hs
import qualified GHC.Generics as Hs
import qualified Unsafe.Coerce as Hs
import Network.GRPC.HighLevel.Generated as HsGRPC
import Network.GRPC.HighLevel.Client as HsGRPC
import Network.GRPC.HighLevel.Server as HsGRPC hiding (serverLoop)
import Network.GRPC.HighLevel.Server.Unregistered as HsGRPC
       (serverLoop)
 
data HStreamBroker request
     response = HStreamBroker{hstreamBrokerConnect ::
                              request 'HsGRPC.Normal HstreamBroker.CommandConnect
                                HstreamBroker.CommandConnected
                                -> Hs.IO (response 'HsGRPC.Normal HstreamBroker.CommandConnected)}
              deriving Hs.Generic
 
hstreamBrokerServer ::
                      HStreamBroker HsGRPC.ServerRequest HsGRPC.ServerResponse ->
                        HsGRPC.ServiceOptions -> Hs.IO ()
hstreamBrokerServer
  HStreamBroker{hstreamBrokerConnect = hstreamBrokerConnect}
  (ServiceOptions serverHost serverPort useCompression
     userAgentPrefix userAgentSuffix initialMetadata sslConfig logger
     serverMaxReceiveMessageLength)
  = (HsGRPC.serverLoop
       HsGRPC.defaultOptions{HsGRPC.optNormalHandlers =
                               [(HsGRPC.UnaryHandler
                                   (HsGRPC.MethodName "/hstream.broker.HStreamBroker/Connect")
                                   (HsGRPC.convertGeneratedServerHandler hstreamBrokerConnect))],
                             HsGRPC.optClientStreamHandlers = [],
                             HsGRPC.optServerStreamHandlers = [],
                             HsGRPC.optBiDiStreamHandlers = [], optServerHost = serverHost,
                             optServerPort = serverPort, optUseCompression = useCompression,
                             optUserAgentPrefix = userAgentPrefix,
                             optUserAgentSuffix = userAgentSuffix,
                             optInitialMetadata = initialMetadata, optSSLConfig = sslConfig,
                             optLogger = logger,
                             optMaxReceiveMessageLength = serverMaxReceiveMessageLength})
 
hstreamBrokerClient ::
                      HsGRPC.Client ->
                        Hs.IO (HStreamBroker HsGRPC.ClientRequest HsGRPC.ClientResult)
hstreamBrokerClient client
  = (Hs.pure HStreamBroker) <*>
      ((Hs.pure (HsGRPC.clientRequest client)) <*>
         (HsGRPC.clientRegisterMethod client
            (HsGRPC.MethodName "/hstream.broker.HStreamBroker/Connect")))
 
data CommandConnect = CommandConnect{commandConnectClientVersion ::
                                     Hs.Text,
                                     commandConnectProtocolVersion :: Hs.Int32}
                    deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)
 
instance HsProtobuf.Named CommandConnect where
        nameOf _ = (Hs.fromString "CommandConnect")
 
instance HsProtobuf.HasDefault CommandConnect
 
instance HsProtobuf.Message CommandConnect where
        encodeMessage _
          CommandConnect{commandConnectClientVersion =
                           commandConnectClientVersion,
                         commandConnectProtocolVersion = commandConnectProtocolVersion}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   commandConnectClientVersion),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 2)
                   commandConnectProtocolVersion)])
        decodeMessage _
          = (Hs.pure CommandConnect) <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 1))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 2))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim HsProtobuf.String)
                (HsProtobuf.Single "client_version")
                []
                ""),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 2)
                (HsProtobuf.Prim HsProtobuf.Int32)
                (HsProtobuf.Single "protocol_version")
                []
                "")]
 
instance HsJSONPB.ToJSONPB CommandConnect where
        toJSONPB (CommandConnect f1 f2)
          = (HsJSONPB.object
               ["client_version" .= f1, "protocol_version" .= f2])
        toEncodingPB (CommandConnect f1 f2)
          = (HsJSONPB.pairs
               ["client_version" .= f1, "protocol_version" .= f2])
 
instance HsJSONPB.FromJSONPB CommandConnect where
        parseJSONPB
          = (HsJSONPB.withObject "CommandConnect"
               (\ obj ->
                  (Hs.pure CommandConnect) <*> obj .: "client_version" <*>
                    obj .: "protocol_version"))
 
instance HsJSONPB.ToJSON CommandConnect where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON CommandConnect where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsJSONPB.ToSchema CommandConnect where
        declareNamedSchema _
          = do let declare_client_version = HsJSONPB.declareSchemaRef
               commandConnectClientVersion <- declare_client_version Proxy.Proxy
               let declare_protocol_version = HsJSONPB.declareSchemaRef
               commandConnectProtocolVersion <- declare_protocol_version
                                                  Proxy.Proxy
               let _ = Hs.pure CommandConnect <*>
                         HsJSONPB.asProxy declare_client_version
                         <*> HsJSONPB.asProxy declare_protocol_version
               Hs.return
                 (HsJSONPB.NamedSchema{HsJSONPB._namedSchemaName =
                                         Hs.Just "CommandConnect",
                                       HsJSONPB._namedSchemaSchema =
                                         Hs.mempty{HsJSONPB._schemaParamSchema =
                                                     Hs.mempty{HsJSONPB._paramSchemaType =
                                                                 Hs.Just HsJSONPB.SwaggerObject},
                                                   HsJSONPB._schemaProperties =
                                                     HsJSONPB.insOrdFromList
                                                       [("client_version",
                                                         commandConnectClientVersion),
                                                        ("protocol_version",
                                                         commandConnectProtocolVersion)]}})
 
data CommandConnected = CommandConnected{commandConnectedServerVersion
                                         :: Hs.Text,
                                         commandConnectedProtocolVersion :: Hs.Int32}
                      deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)
 
instance HsProtobuf.Named CommandConnected where
        nameOf _ = (Hs.fromString "CommandConnected")
 
instance HsProtobuf.HasDefault CommandConnected
 
instance HsProtobuf.Message CommandConnected where
        encodeMessage _
          CommandConnected{commandConnectedServerVersion =
                             commandConnectedServerVersion,
                           commandConnectedProtocolVersion = commandConnectedProtocolVersion}
          = (Hs.mconcat
               [(HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 1)
                   commandConnectedServerVersion),
                (HsProtobuf.encodeMessageField (HsProtobuf.FieldNumber 2)
                   commandConnectedProtocolVersion)])
        decodeMessage _
          = (Hs.pure CommandConnected) <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 1))
              <*>
              (HsProtobuf.at HsProtobuf.decodeMessageField
                 (HsProtobuf.FieldNumber 2))
        dotProto _
          = [(HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 1)
                (HsProtobuf.Prim HsProtobuf.String)
                (HsProtobuf.Single "server_version")
                []
                ""),
             (HsProtobuf.DotProtoField (HsProtobuf.FieldNumber 2)
                (HsProtobuf.Prim HsProtobuf.Int32)
                (HsProtobuf.Single "protocol_version")
                []
                "")]
 
instance HsJSONPB.ToJSONPB CommandConnected where
        toJSONPB (CommandConnected f1 f2)
          = (HsJSONPB.object
               ["server_version" .= f1, "protocol_version" .= f2])
        toEncodingPB (CommandConnected f1 f2)
          = (HsJSONPB.pairs
               ["server_version" .= f1, "protocol_version" .= f2])
 
instance HsJSONPB.FromJSONPB CommandConnected where
        parseJSONPB
          = (HsJSONPB.withObject "CommandConnected"
               (\ obj ->
                  (Hs.pure CommandConnected) <*> obj .: "server_version" <*>
                    obj .: "protocol_version"))
 
instance HsJSONPB.ToJSON CommandConnected where
        toJSON = HsJSONPB.toAesonValue
        toEncoding = HsJSONPB.toAesonEncoding
 
instance HsJSONPB.FromJSON CommandConnected where
        parseJSON = HsJSONPB.parseJSONPB
 
instance HsJSONPB.ToSchema CommandConnected where
        declareNamedSchema _
          = do let declare_server_version = HsJSONPB.declareSchemaRef
               commandConnectedServerVersion <- declare_server_version Proxy.Proxy
               let declare_protocol_version = HsJSONPB.declareSchemaRef
               commandConnectedProtocolVersion <- declare_protocol_version
                                                    Proxy.Proxy
               let _ = Hs.pure CommandConnected <*>
                         HsJSONPB.asProxy declare_server_version
                         <*> HsJSONPB.asProxy declare_protocol_version
               Hs.return
                 (HsJSONPB.NamedSchema{HsJSONPB._namedSchemaName =
                                         Hs.Just "CommandConnected",
                                       HsJSONPB._namedSchemaSchema =
                                         Hs.mempty{HsJSONPB._schemaParamSchema =
                                                     Hs.mempty{HsJSONPB._paramSchemaType =
                                                                 Hs.Just HsJSONPB.SwaggerObject},
                                                   HsJSONPB._schemaProperties =
                                                     HsJSONPB.insOrdFromList
                                                       [("server_version",
                                                         commandConnectedServerVersion),
                                                        ("protocol_version",
                                                         commandConnectedProtocolVersion)]}})