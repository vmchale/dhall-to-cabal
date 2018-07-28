   let prelude = ../../dhall/prelude.dhall
in let types = ../../dhall/types.dhall
in   prelude.defaults.Package
  // { name = "foo"
     , version = prelude.v "0"
     , cabal-version = prelude.v "2.2"
     , license = prelude.types.Licenses.SPDX
         ( prelude.SPDX.and
           ( prelude.SPDX.or
             (prelude.SPDX.license (prelude.types.LicenseId.AGPL_3_0_or_later {=}) prelude.SPDX.noException)
             (prelude.SPDX.licenseVersionOrLater (prelude.types.LicenseId.Apache_2_0 {=}) ([prelude.types.LicenseExceptionId.Classpath_exception_2_0 {=}] : Optional types.LicenseExceptionId))
          )
          ( prelude.SPDX.or
            (prelude.SPDX.ref "MyFancyLicense" ([] : Optional types.LicenseExceptionId))
            (prelude.SPDX.refWithFile "MyFancierLicense" "LICENSE.txt" ([] : Optional types.LicenseExceptionId))
         )
       )
     , library = prelude.unconditional.library prelude.defaults.Library
     }
