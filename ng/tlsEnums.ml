(* TODO *)
(* - EC Named Curve Registry *)
(* - EC Point Format Registry *)
(* - EC Curve Type Registry *)
(* - TLS Supplemental Data Formats (SupplementalDataType) *)
(* - TLS UserMappingType Values *)
(* - TLS SignatureAlgorithm Registry *)
(* - TLS Authorization Data Formats *)
(* - Heartbeat Message Types *)
(* - Heartbeat Modes *)
(* - TLS Certificates *)

enum tls_version (16, UnknownVal V_Unknown, [with_lwt]) =
  | 0x0002 -> V_SSLv2, "SSLv2"
  | 0x0300 -> V_SSLv3, "SSLv3"
  | 0x0301 -> V_TLSv1, "TLSv1.0"
  | 0x0302 -> V_TLSv1_1, "TLSv1.1"
  | 0x0303 -> V_TLSv1_2, "TLSv1.2"

enum tls_content_type (8, UnknownVal CT_Unknown, [with_lwt]) =
  | 0x14 -> CT_ChangeCipherSpec, "ChangeCipherSpec"
  | 0x15 -> CT_Alert, "Alert"
  | 0x16 -> CT_Handshake, "Handshake"
  | 0x17 -> CT_ApplicationData, "ApplicationData"
  | 0x18 -> CT_Heartbeat, "Heartbeat"


enum tls_alert_level (8, UnknownVal AL_Unknown, []) =
  | 1 -> AL_Warning, "Warning"
  | 2 -> AL_Fatal, "Fatal"


enum tls_alert_type (8, UnknownVal AT_Unknown, []) =
  | 0 -> AT_CloseNotify, "CloseNotify"
  | 10 -> AT_UnexpectedMessage, "UnexpectedMessage"
  | 20 -> AT_BadRecordMAC, "BadRecordMAC"
  | 21 -> AT_DecryptionFailed, "DecryptionFailed"   (* Reserved *)
  | 22 -> AT_RecordOverflow, "RecordOverflow"
  | 30 -> AT_DecompressionFailure, "DecompressionFailure"
  | 40 -> AT_HandshakeFailure, "HandshakeFailure"
  | 41 -> AT_NoCertificate, "NoCertificate"         (* Reserved *)
  | 42 -> AT_BadCertificate, "BadCertificate"
  | 43 -> AT_UnsupportedCertificate, "UnsupportedCertificate"
  | 44 -> AT_CertificateRevoked, "CertificateRevoked"
  | 45 -> AT_CertificateExpired, "CertificateExpired"
  | 46 -> AT_CertificateUnknown, "CertificateUnknown"
  | 47 -> AT_IllegalParameter, "IllegalParameter"
  | 48 -> AT_UnknownCA, "UnknownCA"
  | 49 -> AT_AccessDenied, "AccessDenied"
  | 50 -> AT_DecodeError, "DecodeError"
  | 51 -> AT_DecryptError, "DecryptError"
  | 60 -> AT_ExportRestriction, "ExportRestriction" (* Reserved *)
  | 70 -> AT_ProtocolVersion, "ProtocolVersion"
  | 71 -> AT_InsufficientSecurity, "InsufficientSecurity"
  | 80 -> AT_InternalError, "InternalError"
  | 90 -> AT_UserCanceled, "UserCanceled"
  | 100 -> AT_NoRenegotiation, "NoRenegotiation"
  | 110 -> AT_UnsupportedExtension, "UnsupportedExtension"
  | 111 -> AT_CertificateUnobtainable, "CerttificateUnobtainable"
  | 112 -> AT_UnrecognizedName, "UnrecognizedName"
  | 113 -> AT_BadCertificateStatusResponse, "BadCertificateStatusResponse"
  | 114 -> AT_BadCertificateHashValue, "BadCertificateHashValue"
  | 115 -> AT_UnknownPSKIdentity, "UnknownPSKIdentity"


enum change_cipher_spec_value (8, UnknownVal CCS_Unknown, []) =
  | 1 -> CCS_ChangeCipherSpec, "ChangeCipherSpec"


enum hs_message_type (8, UnknownVal HT_Unknown, []) =
  | 0 -> HT_HelloRequest, "HelloRequest"
  | 1 -> HT_ClientHello, "ClientHello"
  | 2 -> HT_ServerHello, "ServerHello"
  | 3 -> HT_HelloVerifyRequest, "HelloVerifyRequest"
  | 4 -> HT_NewSessionTicket, "NewSessionTicket"
  | 11 -> HT_Certificate, "Certificate"
  | 12 -> HT_ServerKeyExchange, "ServerKeyExchange"
  | 13 -> HT_CertificateRequest, "CertificateRequest"
  | 14 -> HT_ServerHelloDone, "ServerHelloDone"
  | 15 -> HT_CertificateVerify, "CertificateVerify"
  | 16 -> HT_ClientKeyExchange, "ClientKeyExchange"
  | 20 -> HT_Finished, "Finished"
  | 21 -> HT_CertificateURL, "CertificateURL"
  | 22 -> HT_CertificateStatus, "CertificateStatus"
  | 23 -> HT_SupplementalData, "SupplementalData"

enum ciphersuite (16, UnknownVal TLS_UnknownSuite, []) =
  | 0x0000 -> TLS_NULL_WITH_NULL_NULL, "TLS_NULL_WITH_NULL_NULL"
  | 0x0001 -> TLS_RSA_WITH_NULL_MD5, "TLS_RSA_WITH_NULL_MD5"
  | 0x0002 -> TLS_RSA_WITH_NULL_SHA, "TLS_RSA_WITH_NULL_SHA"
  | 0x0003 -> TLS_RSA_EXPORT_WITH_RC4_40_MD5, "TLS_RSA_EXPORT_WITH_RC4_40_MD5"
  | 0x0004 -> TLS_RSA_WITH_RC4_128_MD5, "TLS_RSA_WITH_RC4_128_MD5"
  | 0x0005 -> TLS_RSA_WITH_RC4_128_SHA, "TLS_RSA_WITH_RC4_128_SHA"
  | 0x0006 -> TLS_RSA_EXPORT_WITH_RC2_CBC_40_MD5, "TLS_RSA_EXPORT_WITH_RC2_CBC_40_MD5"
  | 0x0007 -> TLS_RSA_WITH_IDEA_CBC_SHA, "TLS_RSA_WITH_IDEA_CBC_SHA"
  | 0x0008 -> TLS_RSA_EXPORT_WITH_DES40_CBC_SHA, "TLS_RSA_EXPORT_WITH_DES40_CBC_SHA"
  | 0x0009 -> TLS_RSA_WITH_DES_CBC_SHA, "TLS_RSA_WITH_DES_CBC_SHA"
  | 0x000a -> TLS_RSA_WITH_3DES_EDE_CBC_SHA, "TLS_RSA_WITH_3DES_EDE_CBC_SHA"
  | 0x000b -> TLS_DH_DSS_EXPORT_WITH_DES40_CBC_SHA, "TLS_DH_DSS_EXPORT_WITH_DES40_CBC_SHA"
  | 0x000c -> TLS_DH_DSS_WITH_DES_CBC_SHA, "TLS_DH_DSS_WITH_DES_CBC_SHA"
  | 0x000d -> TLS_DH_DSS_WITH_3DES_EDE_CBC_SHA, "TLS_DH_DSS_WITH_3DES_EDE_CBC_SHA"
  | 0x000e -> TLS_DH_RSA_EXPORT_WITH_DES40_CBC_SHA, "TLS_DH_RSA_EXPORT_WITH_DES40_CBC_SHA"
  | 0x000f -> TLS_DH_RSA_WITH_DES_CBC_SHA, "TLS_DH_RSA_WITH_DES_CBC_SHA"
  | 0x0010 -> TLS_DH_RSA_WITH_3DES_EDE_CBC_SHA, "TLS_DH_RSA_WITH_3DES_EDE_CBC_SHA"
  | 0x0011 -> TLS_DHE_DSS_EXPORT_WITH_DES40_CBC_SHA, "TLS_DHE_DSS_EXPORT_WITH_DES40_CBC_SHA"
  | 0x0012 -> TLS_DHE_DSS_WITH_DES_CBC_SHA, "TLS_DHE_DSS_WITH_DES_CBC_SHA"
  | 0x0013 -> TLS_DHE_DSS_WITH_3DES_EDE_CBC_SHA, "TLS_DHE_DSS_WITH_3DES_EDE_CBC_SHA"
  | 0x0014 -> TLS_DHE_RSA_EXPORT_WITH_DES40_CBC_SHA, "TLS_DHE_RSA_EXPORT_WITH_DES40_CBC_SHA"
  | 0x0015 -> TLS_DHE_RSA_WITH_DES_CBC_SHA, "TLS_DHE_RSA_WITH_DES_CBC_SHA"
  | 0x0016 -> TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA, "TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA"
  | 0x0017 -> TLS_DH_anon_EXPORT_WITH_RC4_40_MD5, "TLS_DH_anon_EXPORT_WITH_RC4_40_MD5"
  | 0x0018 -> TLS_DH_anon_WITH_RC4_128_MD5, "TLS_DH_anon_WITH_RC4_128_MD5"
  | 0x0019 -> TLS_DH_anon_EXPORT_WITH_DES40_CBC_SHA, "TLS_DH_anon_EXPORT_WITH_DES40_CBC_SHA"
  | 0x001a -> TLS_DH_anon_WITH_DES_CBC_SHA, "TLS_DH_anon_WITH_DES_CBC_SHA"
  | 0x001b -> TLS_DH_anon_WITH_3DES_EDE_CBC_SHA, "TLS_DH_anon_WITH_3DES_EDE_CBC_SHA"
  | 0x001e -> TLS_KRB5_WITH_DES_CBC_SHA, "TLS_KRB5_WITH_DES_CBC_SHA"
  | 0x001f -> TLS_KRB5_WITH_3DES_EDE_CBC_SHA, "TLS_KRB5_WITH_3DES_EDE_CBC_SHA"
  | 0x0020 -> TLS_KRB5_WITH_RC4_128_SHA, "TLS_KRB5_WITH_RC4_128_SHA"
  | 0x0021 -> TLS_KRB5_WITH_IDEA_CBC_SHA, "TLS_KRB5_WITH_IDEA_CBC_SHA"
  | 0x0022 -> TLS_KRB5_WITH_DES_CBC_MD5, "TLS_KRB5_WITH_DES_CBC_MD5"
  | 0x0023 -> TLS_KRB5_WITH_3DES_EDE_CBC_MD5, "TLS_KRB5_WITH_3DES_EDE_CBC_MD5"
  | 0x0024 -> TLS_KRB5_WITH_RC4_128_MD5, "TLS_KRB5_WITH_RC4_128_MD5"
  | 0x0025 -> TLS_KRB5_WITH_IDEA_CBC_MD5, "TLS_KRB5_WITH_IDEA_CBC_MD5"
  | 0x0026 -> TLS_KRB5_EXPORT_WITH_DES_CBC_40_SHA, "TLS_KRB5_EXPORT_WITH_DES_CBC_40_SHA"
  | 0x0027 -> TLS_KRB5_EXPORT_WITH_RC2_CBC_40_SHA, "TLS_KRB5_EXPORT_WITH_RC2_CBC_40_SHA"
  | 0x0028 -> TLS_KRB5_EXPORT_WITH_RC4_40_SHA, "TLS_KRB5_EXPORT_WITH_RC4_40_SHA"
  | 0x0029 -> TLS_KRB5_EXPORT_WITH_DES_CBC_40_MD5, "TLS_KRB5_EXPORT_WITH_DES_CBC_40_MD5"
  | 0x002a -> TLS_KRB5_EXPORT_WITH_RC2_CBC_40_MD5, "TLS_KRB5_EXPORT_WITH_RC2_CBC_40_MD5"
  | 0x002b -> TLS_KRB5_EXPORT_WITH_RC4_40_MD5, "TLS_KRB5_EXPORT_WITH_RC4_40_MD5"
  | 0x002c -> TLS_PSK_WITH_NULL_SHA, "TLS_PSK_WITH_NULL_SHA"
  | 0x002d -> TLS_DHE_PSK_WITH_NULL_SHA, "TLS_DHE_PSK_WITH_NULL_SHA"
  | 0x002e -> TLS_RSA_PSK_WITH_NULL_SHA, "TLS_RSA_PSK_WITH_NULL_SHA"
  | 0x002f -> TLS_RSA_WITH_AES_128_CBC_SHA, "TLS_RSA_WITH_AES_128_CBC_SHA"
  | 0x0030 -> TLS_DH_DSS_WITH_AES_128_CBC_SHA, "TLS_DH_DSS_WITH_AES_128_CBC_SHA"
  | 0x0031 -> TLS_DH_RSA_WITH_AES_128_CBC_SHA, "TLS_DH_RSA_WITH_AES_128_CBC_SHA"
  | 0x0032 -> TLS_DHE_DSS_WITH_AES_128_CBC_SHA, "TLS_DHE_DSS_WITH_AES_128_CBC_SHA"
  | 0x0033 -> TLS_DHE_RSA_WITH_AES_128_CBC_SHA, "TLS_DHE_RSA_WITH_AES_128_CBC_SHA"
  | 0x0034 -> TLS_DH_anon_WITH_AES_128_CBC_SHA, "TLS_DH_anon_WITH_AES_128_CBC_SHA"
  | 0x0035 -> TLS_RSA_WITH_AES_256_CBC_SHA, "TLS_RSA_WITH_AES_256_CBC_SHA"
  | 0x0036 -> TLS_DH_DSS_WITH_AES_256_CBC_SHA, "TLS_DH_DSS_WITH_AES_256_CBC_SHA"
  | 0x0037 -> TLS_DH_RSA_WITH_AES_256_CBC_SHA, "TLS_DH_RSA_WITH_AES_256_CBC_SHA"
  | 0x0038 -> TLS_DHE_DSS_WITH_AES_256_CBC_SHA, "TLS_DHE_DSS_WITH_AES_256_CBC_SHA"
  | 0x0039 -> TLS_DHE_RSA_WITH_AES_256_CBC_SHA, "TLS_DHE_RSA_WITH_AES_256_CBC_SHA"
  | 0x003a -> TLS_DH_anon_WITH_AES_256_CBC_SHA, "TLS_DH_anon_WITH_AES_256_CBC_SHA"
  | 0x003b -> TLS_RSA_WITH_NULL_SHA256, "TLS_RSA_WITH_NULL_SHA256"
  | 0x003c -> TLS_RSA_WITH_AES_128_CBC_SHA256, "TLS_RSA_WITH_AES_128_CBC_SHA256"
  | 0x003d -> TLS_RSA_WITH_AES_256_CBC_SHA256, "TLS_RSA_WITH_AES_256_CBC_SHA256"
  | 0x003e -> TLS_DH_DSS_WITH_AES_128_CBC_SHA256, "TLS_DH_DSS_WITH_AES_128_CBC_SHA256"
  | 0x003f -> TLS_DH_RSA_WITH_AES_128_CBC_SHA256, "TLS_DH_RSA_WITH_AES_128_CBC_SHA256"
  | 0x0040 -> TLS_DHE_DSS_WITH_AES_128_CBC_SHA256, "TLS_DHE_DSS_WITH_AES_128_CBC_SHA256"
  | 0x0041 -> TLS_RSA_WITH_CAMELLIA_128_CBC_SHA, "TLS_RSA_WITH_CAMELLIA_128_CBC_SHA"
  | 0x0042 -> TLS_DH_DSS_WITH_CAMELLIA_128_CBC_SHA, "TLS_DH_DSS_WITH_CAMELLIA_128_CBC_SHA"
  | 0x0043 -> TLS_DH_RSA_WITH_CAMELLIA_128_CBC_SHA, "TLS_DH_RSA_WITH_CAMELLIA_128_CBC_SHA"
  | 0x0044 -> TLS_DHE_DSS_WITH_CAMELLIA_128_CBC_SHA, "TLS_DHE_DSS_WITH_CAMELLIA_128_CBC_SHA"
  | 0x0045 -> TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA, "TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA"
  | 0x0046 -> TLS_DH_anon_WITH_CAMELLIA_128_CBC_SHA, "TLS_DH_anon_WITH_CAMELLIA_128_CBC_SHA"
  | 0x0067 -> TLS_DHE_RSA_WITH_AES_128_CBC_SHA256, "TLS_DHE_RSA_WITH_AES_128_CBC_SHA256"
  | 0x0068 -> TLS_DH_DSS_WITH_AES_256_CBC_SHA256, "TLS_DH_DSS_WITH_AES_256_CBC_SHA256"
  | 0x0069 -> TLS_DH_RSA_WITH_AES_256_CBC_SHA256, "TLS_DH_RSA_WITH_AES_256_CBC_SHA256"
  | 0x006a -> TLS_DHE_DSS_WITH_AES_256_CBC_SHA256, "TLS_DHE_DSS_WITH_AES_256_CBC_SHA256"
  | 0x006b -> TLS_DHE_RSA_WITH_AES_256_CBC_SHA256, "TLS_DHE_RSA_WITH_AES_256_CBC_SHA256"
  | 0x006c -> TLS_DH_anon_WITH_AES_128_CBC_SHA256, "TLS_DH_anon_WITH_AES_128_CBC_SHA256"
  | 0x006d -> TLS_DH_anon_WITH_AES_256_CBC_SHA256, "TLS_DH_anon_WITH_AES_256_CBC_SHA256"
  | 0x0084 -> TLS_RSA_WITH_CAMELLIA_256_CBC_SHA, "TLS_RSA_WITH_CAMELLIA_256_CBC_SHA"
  | 0x0085 -> TLS_DH_DSS_WITH_CAMELLIA_256_CBC_SHA, "TLS_DH_DSS_WITH_CAMELLIA_256_CBC_SHA"
  | 0x0086 -> TLS_DH_RSA_WITH_CAMELLIA_256_CBC_SHA, "TLS_DH_RSA_WITH_CAMELLIA_256_CBC_SHA"
  | 0x0087 -> TLS_DHE_DSS_WITH_CAMELLIA_256_CBC_SHA, "TLS_DHE_DSS_WITH_CAMELLIA_256_CBC_SHA"
  | 0x0088 -> TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA, "TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA"
  | 0x0089 -> TLS_DH_anon_WITH_CAMELLIA_256_CBC_SHA, "TLS_DH_anon_WITH_CAMELLIA_256_CBC_SHA"
  | 0x008a -> TLS_PSK_WITH_RC4_128_SHA, "TLS_PSK_WITH_RC4_128_SHA"
  | 0x008b -> TLS_PSK_WITH_3DES_EDE_CBC_SHA, "TLS_PSK_WITH_3DES_EDE_CBC_SHA"
  | 0x008c -> TLS_PSK_WITH_AES_128_CBC_SHA, "TLS_PSK_WITH_AES_128_CBC_SHA"
  | 0x008d -> TLS_PSK_WITH_AES_256_CBC_SHA, "TLS_PSK_WITH_AES_256_CBC_SHA"
  | 0x008e -> TLS_DHE_PSK_WITH_RC4_128_SHA, "TLS_DHE_PSK_WITH_RC4_128_SHA"
  | 0x008f -> TLS_DHE_PSK_WITH_3DES_EDE_CBC_SHA, "TLS_DHE_PSK_WITH_3DES_EDE_CBC_SHA"
  | 0x0090 -> TLS_DHE_PSK_WITH_AES_128_CBC_SHA, "TLS_DHE_PSK_WITH_AES_128_CBC_SHA"
  | 0x0091 -> TLS_DHE_PSK_WITH_AES_256_CBC_SHA, "TLS_DHE_PSK_WITH_AES_256_CBC_SHA"
  | 0x0092 -> TLS_RSA_PSK_WITH_RC4_128_SHA, "TLS_RSA_PSK_WITH_RC4_128_SHA"
  | 0x0093 -> TLS_RSA_PSK_WITH_3DES_EDE_CBC_SHA, "TLS_RSA_PSK_WITH_3DES_EDE_CBC_SHA"
  | 0x0094 -> TLS_RSA_PSK_WITH_AES_128_CBC_SHA, "TLS_RSA_PSK_WITH_AES_128_CBC_SHA"
  | 0x0095 -> TLS_RSA_PSK_WITH_AES_256_CBC_SHA, "TLS_RSA_PSK_WITH_AES_256_CBC_SHA"
  | 0x0096 -> TLS_RSA_WITH_SEED_CBC_SHA, "TLS_RSA_WITH_SEED_CBC_SHA"
  | 0x0097 -> TLS_DH_DSS_WITH_SEED_CBC_SHA, "TLS_DH_DSS_WITH_SEED_CBC_SHA"
  | 0x0098 -> TLS_DH_RSA_WITH_SEED_CBC_SHA, "TLS_DH_RSA_WITH_SEED_CBC_SHA"
  | 0x0099 -> TLS_DHE_DSS_WITH_SEED_CBC_SHA, "TLS_DHE_DSS_WITH_SEED_CBC_SHA"
  | 0x009a -> TLS_DHE_RSA_WITH_SEED_CBC_SHA, "TLS_DHE_RSA_WITH_SEED_CBC_SHA"
  | 0x009b -> TLS_DH_anon_WITH_SEED_CBC_SHA, "TLS_DH_anon_WITH_SEED_CBC_SHA"
  | 0x009c -> TLS_RSA_WITH_AES_128_GCM_SHA256, "TLS_RSA_WITH_AES_128_GCM_SHA256"
  | 0x009d -> TLS_RSA_WITH_AES_256_GCM_SHA384, "TLS_RSA_WITH_AES_256_GCM_SHA384"
  | 0x009e -> TLS_DHE_RSA_WITH_AES_128_GCM_SHA256, "TLS_DHE_RSA_WITH_AES_128_GCM_SHA256"
  | 0x009f -> TLS_DHE_RSA_WITH_AES_256_GCM_SHA384, "TLS_DHE_RSA_WITH_AES_256_GCM_SHA384"
  | 0x00a0 -> TLS_DH_RSA_WITH_AES_128_GCM_SHA256, "TLS_DH_RSA_WITH_AES_128_GCM_SHA256"
  | 0x00a1 -> TLS_DH_RSA_WITH_AES_256_GCM_SHA384, "TLS_DH_RSA_WITH_AES_256_GCM_SHA384"
  | 0x00a2 -> TLS_DHE_DSS_WITH_AES_128_GCM_SHA256, "TLS_DHE_DSS_WITH_AES_128_GCM_SHA256"
  | 0x00a3 -> TLS_DHE_DSS_WITH_AES_256_GCM_SHA384, "TLS_DHE_DSS_WITH_AES_256_GCM_SHA384"
  | 0x00a4 -> TLS_DH_DSS_WITH_AES_128_GCM_SHA256, "TLS_DH_DSS_WITH_AES_128_GCM_SHA256"
  | 0x00a5 -> TLS_DH_DSS_WITH_AES_256_GCM_SHA384, "TLS_DH_DSS_WITH_AES_256_GCM_SHA384"
  | 0x00a6 -> TLS_DH_anon_WITH_AES_128_GCM_SHA256, "TLS_DH_anon_WITH_AES_128_GCM_SHA256"
  | 0x00a7 -> TLS_DH_anon_WITH_AES_256_GCM_SHA384, "TLS_DH_anon_WITH_AES_256_GCM_SHA384"
  | 0x00a8 -> TLS_PSK_WITH_AES_128_GCM_SHA256, "TLS_PSK_WITH_AES_128_GCM_SHA256"
  | 0x00a9 -> TLS_PSK_WITH_AES_256_GCM_SHA384, "TLS_PSK_WITH_AES_256_GCM_SHA384"
  | 0x00aa -> TLS_DHE_PSK_WITH_AES_128_GCM_SHA256, "TLS_DHE_PSK_WITH_AES_128_GCM_SHA256"
  | 0x00ab -> TLS_DHE_PSK_WITH_AES_256_GCM_SHA384, "TLS_DHE_PSK_WITH_AES_256_GCM_SHA384"
  | 0x00ac -> TLS_RSA_PSK_WITH_AES_128_GCM_SHA256, "TLS_RSA_PSK_WITH_AES_128_GCM_SHA256"
  | 0x00ad -> TLS_RSA_PSK_WITH_AES_256_GCM_SHA384, "TLS_RSA_PSK_WITH_AES_256_GCM_SHA384"
  | 0x00ae -> TLS_PSK_WITH_AES_128_CBC_SHA256, "TLS_PSK_WITH_AES_128_CBC_SHA256"
  | 0x00af -> TLS_PSK_WITH_AES_256_CBC_SHA384, "TLS_PSK_WITH_AES_256_CBC_SHA384"
  | 0x00b0 -> TLS_PSK_WITH_NULL_SHA256, "TLS_PSK_WITH_NULL_SHA256"
  | 0x00b1 -> TLS_PSK_WITH_NULL_SHA384, "TLS_PSK_WITH_NULL_SHA384"
  | 0x00b2 -> TLS_DHE_PSK_WITH_AES_128_CBC_SHA256, "TLS_DHE_PSK_WITH_AES_128_CBC_SHA256"
  | 0x00b3 -> TLS_DHE_PSK_WITH_AES_256_CBC_SHA384, "TLS_DHE_PSK_WITH_AES_256_CBC_SHA384"
  | 0x00b4 -> TLS_DHE_PSK_WITH_NULL_SHA256, "TLS_DHE_PSK_WITH_NULL_SHA256"
  | 0x00b5 -> TLS_DHE_PSK_WITH_NULL_SHA384, "TLS_DHE_PSK_WITH_NULL_SHA384"
  | 0x00b6 -> TLS_RSA_PSK_WITH_AES_128_CBC_SHA256, "TLS_RSA_PSK_WITH_AES_128_CBC_SHA256"
  | 0x00b7 -> TLS_RSA_PSK_WITH_AES_256_CBC_SHA384, "TLS_RSA_PSK_WITH_AES_256_CBC_SHA384"
  | 0x00b8 -> TLS_RSA_PSK_WITH_NULL_SHA256, "TLS_RSA_PSK_WITH_NULL_SHA256"
  | 0x00b9 -> TLS_RSA_PSK_WITH_NULL_SHA384, "TLS_RSA_PSK_WITH_NULL_SHA384"
  | 0x00ba -> TLS_RSA_WITH_CAMELLIA_128_CBC_SHA256, "TLS_RSA_WITH_CAMELLIA_128_CBC_SHA256"
  | 0x00bb -> TLS_DH_DSS_WITH_CAMELLIA_128_CBC_SHA256, "TLS_DH_DSS_WITH_CAMELLIA_128_CBC_SHA256"
  | 0x00bc -> TLS_DH_RSA_WITH_CAMELLIA_128_CBC_SHA256, "TLS_DH_RSA_WITH_CAMELLIA_128_CBC_SHA256"
  | 0x00bd -> TLS_DHE_DSS_WITH_CAMELLIA_128_CBC_SHA256, "TLS_DHE_DSS_WITH_CAMELLIA_128_CBC_SHA256"
  | 0x00be -> TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA256, "TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA256"
  | 0x00bf -> TLS_DH_anon_WITH_CAMELLIA_128_CBC_SHA256, "TLS_DH_anon_WITH_CAMELLIA_128_CBC_SHA256"
  | 0x00c0 -> TLS_RSA_WITH_CAMELLIA_256_CBC_SHA256, "TLS_RSA_WITH_CAMELLIA_256_CBC_SHA256"
  | 0x00c1 -> TLS_DH_DSS_WITH_CAMELLIA_256_CBC_SHA256, "TLS_DH_DSS_WITH_CAMELLIA_256_CBC_SHA256"
  | 0x00c2 -> TLS_DH_RSA_WITH_CAMELLIA_256_CBC_SHA256, "TLS_DH_RSA_WITH_CAMELLIA_256_CBC_SHA256"
  | 0x00c3 -> TLS_DHE_DSS_WITH_CAMELLIA_256_CBC_SHA256, "TLS_DHE_DSS_WITH_CAMELLIA_256_CBC_SHA256"
  | 0x00c4 -> TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA256, "TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA256"
  | 0x00c5 -> TLS_DH_anon_WITH_CAMELLIA_256_CBC_SHA256, "TLS_DH_anon_WITH_CAMELLIA_256_CBC_SHA256"
  | 0xc001 -> TLS_ECDH_ECDSA_WITH_NULL_SHA, "TLS_ECDH_ECDSA_WITH_NULL_SHA"
  | 0xc002 -> TLS_ECDH_ECDSA_WITH_RC4_128_SHA, "TLS_ECDH_ECDSA_WITH_RC4_128_SHA"
  | 0xc003 -> TLS_ECDH_ECDSA_WITH_3DES_EDE_CBC_SHA, "TLS_ECDH_ECDSA_WITH_3DES_EDE_CBC_SHA"
  | 0xc004 -> TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA, "TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA"
  | 0xc005 -> TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA, "TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA"
  | 0xc006 -> TLS_ECDHE_ECDSA_WITH_NULL_SHA, "TLS_ECDHE_ECDSA_WITH_NULL_SHA"
  | 0xc007 -> TLS_ECDHE_ECDSA_WITH_RC4_128_SHA, "TLS_ECDHE_ECDSA_WITH_RC4_128_SHA"
  | 0xc008 -> TLS_ECDHE_ECDSA_WITH_3DES_EDE_CBC_SHA, "TLS_ECDHE_ECDSA_WITH_3DES_EDE_CBC_SHA"
  | 0xc009 -> TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA, "TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA"
  | 0xc00a -> TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA, "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA"
  | 0xc00b -> TLS_ECDH_RSA_WITH_NULL_SHA, "TLS_ECDH_RSA_WITH_NULL_SHA"
  | 0xc00c -> TLS_ECDH_RSA_WITH_RC4_128_SHA, "TLS_ECDH_RSA_WITH_RC4_128_SHA"
  | 0xc00d -> TLS_ECDH_RSA_WITH_3DES_EDE_CBC_SHA, "TLS_ECDH_RSA_WITH_3DES_EDE_CBC_SHA"
  | 0xc00e -> TLS_ECDH_RSA_WITH_AES_128_CBC_SHA, "TLS_ECDH_RSA_WITH_AES_128_CBC_SHA"
  | 0xc00f -> TLS_ECDH_RSA_WITH_AES_256_CBC_SHA, "TLS_ECDH_RSA_WITH_AES_256_CBC_SHA"
  | 0xc010 -> TLS_ECDHE_RSA_WITH_NULL_SHA, "TLS_ECDHE_RSA_WITH_NULL_SHA"
  | 0xc011 -> TLS_ECDHE_RSA_WITH_RC4_128_SHA, "TLS_ECDHE_RSA_WITH_RC4_128_SHA"
  | 0xc012 -> TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA, "TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA"
  | 0xc013 -> TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA, "TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA"
  | 0xc014 -> TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA, "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA"
  | 0xc015 -> TLS_ECDH_anon_WITH_NULL_SHA, "TLS_ECDH_anon_WITH_NULL_SHA"
  | 0xc016 -> TLS_ECDH_anon_WITH_RC4_128_SHA, "TLS_ECDH_anon_WITH_RC4_128_SHA"
  | 0xc017 -> TLS_ECDH_anon_WITH_3DES_EDE_CBC_SHA, "TLS_ECDH_anon_WITH_3DES_EDE_CBC_SHA"
  | 0xc018 -> TLS_ECDH_anon_WITH_AES_128_CBC_SHA, "TLS_ECDH_anon_WITH_AES_128_CBC_SHA"
  | 0xc019 -> TLS_ECDH_anon_WITH_AES_256_CBC_SHA, "TLS_ECDH_anon_WITH_AES_256_CBC_SHA"
  | 0xc01a -> TLS_SRP_SHA_WITH_3DES_EDE_CBC_SHA, "TLS_SRP_SHA_WITH_3DES_EDE_CBC_SHA"
  | 0xc01b -> TLS_SRP_SHA_RSA_WITH_3DES_EDE_CBC_SHA, "TLS_SRP_SHA_RSA_WITH_3DES_EDE_CBC_SHA"
  | 0xc01c -> TLS_SRP_SHA_DSS_WITH_3DES_EDE_CBC_SHA, "TLS_SRP_SHA_DSS_WITH_3DES_EDE_CBC_SHA"
  | 0xc01d -> TLS_SRP_SHA_WITH_AES_128_CBC_SHA, "TLS_SRP_SHA_WITH_AES_128_CBC_SHA"
  | 0xc01e -> TLS_SRP_SHA_RSA_WITH_AES_128_CBC_SHA, "TLS_SRP_SHA_RSA_WITH_AES_128_CBC_SHA"
  | 0xc01f -> TLS_SRP_SHA_DSS_WITH_AES_128_CBC_SHA, "TLS_SRP_SHA_DSS_WITH_AES_128_CBC_SHA"
  | 0xc020 -> TLS_SRP_SHA_WITH_AES_256_CBC_SHA, "TLS_SRP_SHA_WITH_AES_256_CBC_SHA"
  | 0xc021 -> TLS_SRP_SHA_RSA_WITH_AES_256_CBC_SHA, "TLS_SRP_SHA_RSA_WITH_AES_256_CBC_SHA"
  | 0xc022 -> TLS_SRP_SHA_DSS_WITH_AES_256_CBC_SHA, "TLS_SRP_SHA_DSS_WITH_AES_256_CBC_SHA"
  | 0xc023 -> TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256, "TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256"
  | 0xc024 -> TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384, "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384"
  | 0xc025 -> TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA256, "TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA256"
  | 0xc026 -> TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA384, "TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA384"
  | 0xc027 -> TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256, "TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256"
  | 0xc028 -> TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384, "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384"
  | 0xc029 -> TLS_ECDH_RSA_WITH_AES_128_CBC_SHA256, "TLS_ECDH_RSA_WITH_AES_128_CBC_SHA256"
  | 0xc02a -> TLS_ECDH_RSA_WITH_AES_256_CBC_SHA384, "TLS_ECDH_RSA_WITH_AES_256_CBC_SHA384"
  | 0xc02b -> TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256, "TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256"
  | 0xc02c -> TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384, "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384"
  | 0xc02d -> TLS_ECDH_ECDSA_WITH_AES_128_GCM_SHA256, "TLS_ECDH_ECDSA_WITH_AES_128_GCM_SHA256"
  | 0xc02e -> TLS_ECDH_ECDSA_WITH_AES_256_GCM_SHA384, "TLS_ECDH_ECDSA_WITH_AES_256_GCM_SHA384"
  | 0xc02f -> TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256, "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256"
  | 0xc030 -> TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384, "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384"
  | 0xc031 -> TLS_ECDH_RSA_WITH_AES_128_GCM_SHA256, "TLS_ECDH_RSA_WITH_AES_128_GCM_SHA256"
  | 0xc032 -> TLS_ECDH_RSA_WITH_AES_256_GCM_SHA384, "TLS_ECDH_RSA_WITH_AES_256_GCM_SHA384"
  | 0xc033 -> TLS_ECDHE_PSK_WITH_RC4_128_SHA, "TLS_ECDHE_PSK_WITH_RC4_128_SHA"
  | 0xc034 -> TLS_ECDHE_PSK_WITH_3DES_EDE_CBC_SHA, "TLS_ECDHE_PSK_WITH_3DES_EDE_CBC_SHA"
  | 0xc035 -> TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA, "TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA"
  | 0xc036 -> TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA, "TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA"
  | 0xc037 -> TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA256, "TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA256"
  | 0xc038 -> TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA384, "TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA384"
  | 0xc039 -> TLS_ECDHE_PSK_WITH_NULL_SHA, "TLS_ECDHE_PSK_WITH_NULL_SHA"
  | 0xc03a -> TLS_ECDHE_PSK_WITH_NULL_SHA256, "TLS_ECDHE_PSK_WITH_NULL_SHA256"
  | 0xc03b -> TLS_ECDHE_PSK_WITH_NULL_SHA384, "TLS_ECDHE_PSK_WITH_NULL_SHA384"
  | 0xc03c -> TLS_RSA_WITH_ARIA_128_CBC_SHA256, "TLS_RSA_WITH_ARIA_128_CBC_SHA256"
  | 0xc03d -> TLS_RSA_WITH_ARIA_256_CBC_SHA384, "TLS_RSA_WITH_ARIA_256_CBC_SHA384"
  | 0xc03e -> TLS_DH_DSS_WITH_ARIA_128_CBC_SHA256, "TLS_DH_DSS_WITH_ARIA_128_CBC_SHA256"
  | 0xc03f -> TLS_DH_DSS_WITH_ARIA_256_CBC_SHA384, "TLS_DH_DSS_WITH_ARIA_256_CBC_SHA384"
  | 0xc040 -> TLS_DH_RSA_WITH_ARIA_128_CBC_SHA256, "TLS_DH_RSA_WITH_ARIA_128_CBC_SHA256"
  | 0xc041 -> TLS_DH_RSA_WITH_ARIA_256_CBC_SHA384, "TLS_DH_RSA_WITH_ARIA_256_CBC_SHA384"
  | 0xc042 -> TLS_DHE_DSS_WITH_ARIA_128_CBC_SHA256, "TLS_DHE_DSS_WITH_ARIA_128_CBC_SHA256"
  | 0xc043 -> TLS_DHE_DSS_WITH_ARIA_256_CBC_SHA384, "TLS_DHE_DSS_WITH_ARIA_256_CBC_SHA384"
  | 0xc044 -> TLS_DHE_RSA_WITH_ARIA_128_CBC_SHA256, "TLS_DHE_RSA_WITH_ARIA_128_CBC_SHA256"
  | 0xc045 -> TLS_DHE_RSA_WITH_ARIA_256_CBC_SHA384, "TLS_DHE_RSA_WITH_ARIA_256_CBC_SHA384"
  | 0xc046 -> TLS_DH_anon_WITH_ARIA_128_CBC_SHA256, "TLS_DH_anon_WITH_ARIA_128_CBC_SHA256"
  | 0xc047 -> TLS_DH_anon_WITH_ARIA_256_CBC_SHA384, "TLS_DH_anon_WITH_ARIA_256_CBC_SHA384"
  | 0xc048 -> TLS_ECDHE_ECDSA_WITH_ARIA_128_CBC_SHA256, "TLS_ECDHE_ECDSA_WITH_ARIA_128_CBC_SHA256"
  | 0xc049 -> TLS_ECDHE_ECDSA_WITH_ARIA_256_CBC_SHA384, "TLS_ECDHE_ECDSA_WITH_ARIA_256_CBC_SHA384"
  | 0xc04a -> TLS_ECDH_ECDSA_WITH_ARIA_128_CBC_SHA256, "TLS_ECDH_ECDSA_WITH_ARIA_128_CBC_SHA256"
  | 0xc04b -> TLS_ECDH_ECDSA_WITH_ARIA_256_CBC_SHA384, "TLS_ECDH_ECDSA_WITH_ARIA_256_CBC_SHA384"
  | 0xc04c -> TLS_ECDHE_RSA_WITH_ARIA_128_CBC_SHA256, "TLS_ECDHE_RSA_WITH_ARIA_128_CBC_SHA256"
  | 0xc04d -> TLS_ECDHE_RSA_WITH_ARIA_256_CBC_SHA384, "TLS_ECDHE_RSA_WITH_ARIA_256_CBC_SHA384"
  | 0xc04e -> TLS_ECDH_RSA_WITH_ARIA_128_CBC_SHA256, "TLS_ECDH_RSA_WITH_ARIA_128_CBC_SHA256"
  | 0xc04f -> TLS_ECDH_RSA_WITH_ARIA_256_CBC_SHA384, "TLS_ECDH_RSA_WITH_ARIA_256_CBC_SHA384"
  | 0xc050 -> TLS_RSA_WITH_ARIA_128_GCM_SHA256, "TLS_RSA_WITH_ARIA_128_GCM_SHA256"
  | 0xc051 -> TLS_RSA_WITH_ARIA_256_GCM_SHA384, "TLS_RSA_WITH_ARIA_256_GCM_SHA384"
  | 0xc052 -> TLS_DHE_RSA_WITH_ARIA_128_GCM_SHA256, "TLS_DHE_RSA_WITH_ARIA_128_GCM_SHA256"
  | 0xc053 -> TLS_DHE_RSA_WITH_ARIA_256_GCM_SHA384, "TLS_DHE_RSA_WITH_ARIA_256_GCM_SHA384"
  | 0xc054 -> TLS_DH_RSA_WITH_ARIA_128_GCM_SHA256, "TLS_DH_RSA_WITH_ARIA_128_GCM_SHA256"
  | 0xc055 -> TLS_DH_RSA_WITH_ARIA_256_GCM_SHA384, "TLS_DH_RSA_WITH_ARIA_256_GCM_SHA384"
  | 0xc056 -> TLS_DHE_DSS_WITH_ARIA_128_GCM_SHA256, "TLS_DHE_DSS_WITH_ARIA_128_GCM_SHA256"
  | 0xc057 -> TLS_DHE_DSS_WITH_ARIA_256_GCM_SHA384, "TLS_DHE_DSS_WITH_ARIA_256_GCM_SHA384"
  | 0xc058 -> TLS_DH_DSS_WITH_ARIA_128_GCM_SHA256, "TLS_DH_DSS_WITH_ARIA_128_GCM_SHA256"
  | 0xc059 -> TLS_DH_DSS_WITH_ARIA_256_GCM_SHA384, "TLS_DH_DSS_WITH_ARIA_256_GCM_SHA384"
  | 0xc05a -> TLS_DH_anon_WITH_ARIA_128_GCM_SHA256, "TLS_DH_anon_WITH_ARIA_128_GCM_SHA256"
  | 0xc05b -> TLS_DH_anon_WITH_ARIA_256_GCM_SHA384, "TLS_DH_anon_WITH_ARIA_256_GCM_SHA384"
  | 0xc05c -> TLS_ECDHE_ECDSA_WITH_ARIA_128_GCM_SHA256, "TLS_ECDHE_ECDSA_WITH_ARIA_128_GCM_SHA256"
  | 0xc05d -> TLS_ECDHE_ECDSA_WITH_ARIA_256_GCM_SHA384, "TLS_ECDHE_ECDSA_WITH_ARIA_256_GCM_SHA384"
  | 0xc05e -> TLS_ECDH_ECDSA_WITH_ARIA_128_GCM_SHA256, "TLS_ECDH_ECDSA_WITH_ARIA_128_GCM_SHA256"
  | 0xc05f -> TLS_ECDH_ECDSA_WITH_ARIA_256_GCM_SHA384, "TLS_ECDH_ECDSA_WITH_ARIA_256_GCM_SHA384"
  | 0xc060 -> TLS_ECDHE_RSA_WITH_ARIA_128_GCM_SHA256, "TLS_ECDHE_RSA_WITH_ARIA_128_GCM_SHA256"
  | 0xc061 -> TLS_ECDHE_RSA_WITH_ARIA_256_GCM_SHA384, "TLS_ECDHE_RSA_WITH_ARIA_256_GCM_SHA384"
  | 0xc062 -> TLS_ECDH_RSA_WITH_ARIA_128_GCM_SHA256, "TLS_ECDH_RSA_WITH_ARIA_128_GCM_SHA256"
  | 0xc063 -> TLS_ECDH_RSA_WITH_ARIA_256_GCM_SHA384, "TLS_ECDH_RSA_WITH_ARIA_256_GCM_SHA384"
  | 0xc064 -> TLS_PSK_WITH_ARIA_128_CBC_SHA256, "TLS_PSK_WITH_ARIA_128_CBC_SHA256"
  | 0xc065 -> TLS_PSK_WITH_ARIA_256_CBC_SHA384, "TLS_PSK_WITH_ARIA_256_CBC_SHA384"
  | 0xc066 -> TLS_DHE_PSK_WITH_ARIA_128_CBC_SHA256, "TLS_DHE_PSK_WITH_ARIA_128_CBC_SHA256"
  | 0xc067 -> TLS_DHE_PSK_WITH_ARIA_256_CBC_SHA384, "TLS_DHE_PSK_WITH_ARIA_256_CBC_SHA384"
  | 0xc068 -> TLS_RSA_PSK_WITH_ARIA_128_CBC_SHA256, "TLS_RSA_PSK_WITH_ARIA_128_CBC_SHA256"
  | 0xc069 -> TLS_RSA_PSK_WITH_ARIA_256_CBC_SHA384, "TLS_RSA_PSK_WITH_ARIA_256_CBC_SHA384"
  | 0xc06a -> TLS_PSK_WITH_ARIA_128_GCM_SHA256, "TLS_PSK_WITH_ARIA_128_GCM_SHA256"
  | 0xc06b -> TLS_PSK_WITH_ARIA_256_GCM_SHA384, "TLS_PSK_WITH_ARIA_256_GCM_SHA384"
  | 0xc06c -> TLS_DHE_PSK_WITH_ARIA_128_GCM_SHA256, "TLS_DHE_PSK_WITH_ARIA_128_GCM_SHA256"
  | 0xc06d -> TLS_DHE_PSK_WITH_ARIA_256_GCM_SHA384, "TLS_DHE_PSK_WITH_ARIA_256_GCM_SHA384"
  | 0xc06e -> TLS_RSA_PSK_WITH_ARIA_128_GCM_SHA256, "TLS_RSA_PSK_WITH_ARIA_128_GCM_SHA256"
  | 0xc06f -> TLS_RSA_PSK_WITH_ARIA_256_GCM_SHA384, "TLS_RSA_PSK_WITH_ARIA_256_GCM_SHA384"
  | 0xc070 -> TLS_ECDHE_PSK_WITH_ARIA_128_CBC_SHA256, "TLS_ECDHE_PSK_WITH_ARIA_128_CBC_SHA256"
  | 0xc071 -> TLS_ECDHE_PSK_WITH_ARIA_256_CBC_SHA384, "TLS_ECDHE_PSK_WITH_ARIA_256_CBC_SHA384"
  | 0xc072 -> TLS_ECDHE_ECDSA_WITH_CAMELLIA_128_CBC_SHA256, "TLS_ECDHE_ECDSA_WITH_CAMELLIA_128_CBC_SHA256"
  | 0xc073 -> TLS_ECDHE_ECDSA_WITH_CAMELLIA_256_CBC_SHA384, "TLS_ECDHE_ECDSA_WITH_CAMELLIA_256_CBC_SHA384"
  | 0xc074 -> TLS_ECDH_ECDSA_WITH_CAMELLIA_128_CBC_SHA256, "TLS_ECDH_ECDSA_WITH_CAMELLIA_128_CBC_SHA256"
  | 0xc075 -> TLS_ECDH_ECDSA_WITH_CAMELLIA_256_CBC_SHA384, "TLS_ECDH_ECDSA_WITH_CAMELLIA_256_CBC_SHA384"
  | 0xc076 -> TLS_ECDHE_RSA_WITH_CAMELLIA_128_CBC_SHA256, "TLS_ECDHE_RSA_WITH_CAMELLIA_128_CBC_SHA256"
  | 0xc077 -> TLS_ECDHE_RSA_WITH_CAMELLIA_256_CBC_SHA384, "TLS_ECDHE_RSA_WITH_CAMELLIA_256_CBC_SHA384"
  | 0xc078 -> TLS_ECDH_RSA_WITH_CAMELLIA_128_CBC_SHA256, "TLS_ECDH_RSA_WITH_CAMELLIA_128_CBC_SHA256"
  | 0xc079 -> TLS_ECDH_RSA_WITH_CAMELLIA_256_CBC_SHA384, "TLS_ECDH_RSA_WITH_CAMELLIA_256_CBC_SHA384"
  | 0xc07a -> TLS_RSA_WITH_CAMELLIA_128_GCM_SHA256, "TLS_RSA_WITH_CAMELLIA_128_GCM_SHA256"
  | 0xc07b -> TLS_RSA_WITH_CAMELLIA_256_GCM_SHA384, "TLS_RSA_WITH_CAMELLIA_256_GCM_SHA384"
  | 0xc07c -> TLS_DHE_RSA_WITH_CAMELLIA_128_GCM_SHA256, "TLS_DHE_RSA_WITH_CAMELLIA_128_GCM_SHA256"
  | 0xc07d -> TLS_DHE_RSA_WITH_CAMELLIA_256_GCM_SHA384, "TLS_DHE_RSA_WITH_CAMELLIA_256_GCM_SHA384"
  | 0xc07e -> TLS_DH_RSA_WITH_CAMELLIA_128_GCM_SHA256, "TLS_DH_RSA_WITH_CAMELLIA_128_GCM_SHA256"
  | 0xc07f -> TLS_DH_RSA_WITH_CAMELLIA_256_GCM_SHA384, "TLS_DH_RSA_WITH_CAMELLIA_256_GCM_SHA384"
  | 0xc080 -> TLS_DHE_DSS_WITH_CAMELLIA_128_GCM_SHA256, "TLS_DHE_DSS_WITH_CAMELLIA_128_GCM_SHA256"
  | 0xc081 -> TLS_DHE_DSS_WITH_CAMELLIA_256_GCM_SHA384, "TLS_DHE_DSS_WITH_CAMELLIA_256_GCM_SHA384"
  | 0xc082 -> TLS_DH_DSS_WITH_CAMELLIA_128_GCM_SHA256, "TLS_DH_DSS_WITH_CAMELLIA_128_GCM_SHA256"
  | 0xc083 -> TLS_DH_DSS_WITH_CAMELLIA_256_GCM_SHA384, "TLS_DH_DSS_WITH_CAMELLIA_256_GCM_SHA384"
  | 0xc084 -> TLS_DH_anon_WITH_CAMELLIA_128_GCM_SHA256, "TLS_DH_anon_WITH_CAMELLIA_128_GCM_SHA256"
  | 0xc085 -> TLS_DH_anon_WITH_CAMELLIA_256_GCM_SHA384, "TLS_DH_anon_WITH_CAMELLIA_256_GCM_SHA384"
  | 0xc086 -> TLS_ECDHE_ECDSA_WITH_CAMELLIA_128_GCM_SHA256, "TLS_ECDHE_ECDSA_WITH_CAMELLIA_128_GCM_SHA256"
  | 0xc087 -> TLS_ECDHE_ECDSA_WITH_CAMELLIA_256_GCM_SHA384, "TLS_ECDHE_ECDSA_WITH_CAMELLIA_256_GCM_SHA384"
  | 0xc088 -> TLS_ECDH_ECDSA_WITH_CAMELLIA_128_GCM_SHA256, "TLS_ECDH_ECDSA_WITH_CAMELLIA_128_GCM_SHA256"
  | 0xc089 -> TLS_ECDH_ECDSA_WITH_CAMELLIA_256_GCM_SHA384, "TLS_ECDH_ECDSA_WITH_CAMELLIA_256_GCM_SHA384"
  | 0xc08a -> TLS_ECDHE_RSA_WITH_CAMELLIA_128_GCM_SHA256, "TLS_ECDHE_RSA_WITH_CAMELLIA_128_GCM_SHA256"
  | 0xc08b -> TLS_ECDHE_RSA_WITH_CAMELLIA_256_GCM_SHA384, "TLS_ECDHE_RSA_WITH_CAMELLIA_256_GCM_SHA384"
  | 0xc08c -> TLS_ECDH_RSA_WITH_CAMELLIA_128_GCM_SHA256, "TLS_ECDH_RSA_WITH_CAMELLIA_128_GCM_SHA256"
  | 0xc08d -> TLS_ECDH_RSA_WITH_CAMELLIA_256_GCM_SHA384, "TLS_ECDH_RSA_WITH_CAMELLIA_256_GCM_SHA384"
  | 0xc08e -> TLS_PSK_WITH_CAMELLIA_128_GCM_SHA256, "TLS_PSK_WITH_CAMELLIA_128_GCM_SHA256"
  | 0xc08f -> TLS_PSK_WITH_CAMELLIA_256_GCM_SHA384, "TLS_PSK_WITH_CAMELLIA_256_GCM_SHA384"
  | 0xc090 -> TLS_DHE_PSK_WITH_CAMELLIA_128_GCM_SHA256, "TLS_DHE_PSK_WITH_CAMELLIA_128_GCM_SHA256"
  | 0xc091 -> TLS_DHE_PSK_WITH_CAMELLIA_256_GCM_SHA384, "TLS_DHE_PSK_WITH_CAMELLIA_256_GCM_SHA384"
  | 0xc092 -> TLS_RSA_PSK_WITH_CAMELLIA_128_GCM_SHA256, "TLS_RSA_PSK_WITH_CAMELLIA_128_GCM_SHA256"
  | 0xc093 -> TLS_RSA_PSK_WITH_CAMELLIA_256_GCM_SHA384, "TLS_RSA_PSK_WITH_CAMELLIA_256_GCM_SHA384"
  | 0xc094 -> TLS_PSK_WITH_CAMELLIA_128_CBC_SHA256, "TLS_PSK_WITH_CAMELLIA_128_CBC_SHA256"
  | 0xc095 -> TLS_PSK_WITH_CAMELLIA_256_CBC_SHA384, "TLS_PSK_WITH_CAMELLIA_256_CBC_SHA384"
  | 0xc096 -> TLS_DHE_PSK_WITH_CAMELLIA_128_CBC_SHA256, "TLS_DHE_PSK_WITH_CAMELLIA_128_CBC_SHA256"
  | 0xc097 -> TLS_DHE_PSK_WITH_CAMELLIA_256_CBC_SHA384, "TLS_DHE_PSK_WITH_CAMELLIA_256_CBC_SHA384"
  | 0xc098 -> TLS_RSA_PSK_WITH_CAMELLIA_128_CBC_SHA256, "TLS_RSA_PSK_WITH_CAMELLIA_128_CBC_SHA256"
  | 0xc099 -> TLS_RSA_PSK_WITH_CAMELLIA_256_CBC_SHA384, "TLS_RSA_PSK_WITH_CAMELLIA_256_CBC_SHA384"
  | 0xc09a -> TLS_ECDHE_PSK_WITH_CAMELLIA_128_CBC_SHA256, "TLS_ECDHE_PSK_WITH_CAMELLIA_128_CBC_SHA256"
  | 0xc09b -> TLS_ECDHE_PSK_WITH_CAMELLIA_256_CBC_SHA384, "TLS_ECDHE_PSK_WITH_CAMELLIA_256_CBC_SHA384"
  | 0xfefe -> SSL_RSA_FIPS_WITH_DES_CBC_SHA, "SSL_RSA_FIPS_WITH_DES_CBC_SHA"
  | 0xfeff -> SSL_RSA_FIPS_WITH_3DES_EDE_CBC_SHA, "SSL_RSA_FIPS_WITH_3DES_EDE_CBC_SHA"
  | 0xffe0 -> SSL_RSA_FIPS_WITH_3DES_EDE_CBC_SHA_bis, "SSL_RSA_FIPS_WITH_3DES_EDE_CBC_SHA_bis"
  | 0xffe1 -> SSL_RSA_FIPS_WITH_DES_CBC_SHA_bis, "SSL_RSA_FIPS_WITH_DES_CBC_SHA_bis"
  | 0x00ff -> TLS_EMPTY_RENEGOTIATION_INFO_SCSV, "TLS_EMPTY_RENEGOTIATION_INFO_SCSV"

enum compression_method (8, UnknownVal CM_UnknownVal, []) =
  | 0 -> CM_Null, "Null"
  | 1 -> CM_Defalte, "Deflate"

enum extension_type (16, UnknownVal HE_Unknown, []) =
  | 0 -> HE_ServerName, "ServerName"
  | 1 -> HE_MaxFragmentLength, "MaxFragmentLength"
  | 2 -> HE_ClientCertificateURL, "ClientCertificateURL"
  | 3 -> HE_TrustedCAKeys, "TrustedCAKeys"
  | 4 -> HE_TruncatedMAC, "TruncatedMAC"
  | 5 -> HE_StatusRequest, "StatusRequest"
  | 6 -> HE_UserMapping, "UserMapping"
  | 7 -> HE_ClientAuthz, "ClientAuthz"
  | 8 -> HE_ServerAuthz, "ServerAuthz"
  | 9 -> HE_CertType, "CertType"
  | 10 -> HE_EllipticCurves, "EllipticCurves"
  | 11 -> HE_ECPointFormats, "ECPointFormats"
  | 12 -> HE_SRP, "SRP"
  | 13 -> HE_SignatureAlgorithms, "SignatureAlgorithms"
  | 14 -> HE_UseSRTP, "UseSRTP"
  | 15 -> HE_Heartbeat, "Heartbeat"
  | 35 -> HE_SessionTicket, "SessionTicket"
  | 65281 -> HE_RenegotiationInfo, "RenegotiationInfo"

enum name_type (8, UnknownVal UnknownNameType, []) =
  | 0 -> NT_HostName, "HostName"

enum client_certificate_type (8, UnknownVal CCT_Unknown, []) =
  | 1 -> CCT_RSASign, "RSASign"
  | 2 -> CCT_DSSSign, "DSSSign"
  | 3 -> CCT_RSAFixedDH, "RSAFixedDH"
  | 4 -> CCT_DSSFixedDH, "DSSFixedDH"
  | 5 -> CCT_RSAEphemeralDH, "RSAEphemeralDH"   (* RESERVED *)
  | 6 -> CCT_DSSEphemeralDH, "DSSEphemeralDH"   (* RESERVED *)
  | 20 -> CCT_FortezzaDMS, "FortezzaDMS"         (* RESERVED *)
  | 64 -> CCT_ECDSASign, "ECDSASign"
  | 65 -> CCT_RSAFixedECDH, "RSAFixedECDH"
  | 66 -> CCT_ECDSAFixedECDH, "ECDSAFixedECDH"

enum hash_algorithm (8, UnknownVal HA_Unknown, []) =
  | 0 -> HA_None, "None"
  | 1 -> HA_MD5, "MD5"
  | 2 -> HA_SHA1, "SHA1"
  | 3 -> HA_SHA224, "SHA224"
  | 4 -> HA_SHA256, "SHA256"
  | 5 -> HA_SHA384, "SHA384"
  | 6 -> HA_SHA512, "SHA512"

enum signature_algorithm (8, UnknownVal SA_Unknown, []) =
  | 0 -> SA_Anonymous, "Anonymous"
  | 1 -> SA_RSA, "RSA"
  | 2 -> SA_DSA, "DSA"
  | 3 -> SA_ECDSA, "ECDSA"



(* Internal types *)

type direction = ClientToServer | ServerToClient

type key_exchange_algorithm =
  | KX_RSA
  | KX_DH
  | KX_DHE
  | KX_ECDH
  | KX_ECDHE
  | KX_Unknown

type authentication_algorithm =
  | AU_Null
  | AU_RSA
  | AU_DSS
  | AU_ECDSA
  | AU_Unknown

type encryption_blockcipher =
  | BC_DES
  | BC_RC2
  | BC_IDEA
  | BC_3DES
  | BC_ARIA
  | BC_SEED
  | BC_CAMELLIA
  | BC_AES

type encryption_streamcipher =
  | SC_RC4

type encryption_algorithm =
  | ENC_Null
  | ENC_CBC of encryption_blockcipher * int
  | ENC_GCM of encryption_blockcipher * int
  | ENC_Stream of encryption_streamcipher * int
  | ENC_Unknown

type hash_function =
  | HF_MD5
  | HF_SHA1
  | HF_SHA256
  | HF_SHA384

type integrity_algorithm =
  | MAC_HMAC of hash_function * int
  | MAC_AEAD
  | MAC_Unknown

type pseudo_random_function =
  | PRF_Default
  | PRF_SHA256
  | PRF_SHA384
  | PRF_Unknown

type ciphersuite_description = {
  suite_name : ciphersuite;
  kx : key_exchange_algorithm;
  au : authentication_algorithm;
  enc : encryption_algorithm;
  mac : integrity_algorithm;
  prf : pseudo_random_function;
  export : bool;
  min_version : int;
  max_version : int;
}
