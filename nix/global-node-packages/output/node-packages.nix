# This file has been generated by node2nix 1.6.0. Do not edit!

{nodeEnv, fetchurl, fetchgit, globalBuildInputs ? []}:

let
  sources = {
    "ansi-regex-2.1.1" = {
      name = "ansi-regex";
      packageName = "ansi-regex";
      version = "2.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/ansi-regex/-/ansi-regex-2.1.1.tgz";
        sha1 = "c3b33ab5ee360d86e0e628f0468ae7ef27d654df";
      };
    };
    "ansi-styles-2.2.1" = {
      name = "ansi-styles";
      packageName = "ansi-styles";
      version = "2.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/ansi-styles/-/ansi-styles-2.2.1.tgz";
        sha1 = "b432dd3358b634cf75e1e4664368240533c1ddbe";
      };
    };
    "async-0.2.10" = {
      name = "async";
      packageName = "async";
      version = "0.2.10";
      src = fetchurl {
        url = "https://registry.npmjs.org/async/-/async-0.2.10.tgz";
        sha1 = "b6bbe0b0674b9d719708ca38de8c237cb526c3d1";
      };
    };
    "balanced-match-1.0.0" = {
      name = "balanced-match";
      packageName = "balanced-match";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/balanced-match/-/balanced-match-1.0.0.tgz";
        sha1 = "89b4d199ab2bee49de164ea02b89ce462d71b767";
      };
    };
    "brace-expansion-1.1.11" = {
      name = "brace-expansion";
      packageName = "brace-expansion";
      version = "1.1.11";
      src = fetchurl {
        url = "https://registry.npmjs.org/brace-expansion/-/brace-expansion-1.1.11.tgz";
        sha512 = "iCuPHDFgrHX7H2vEI/5xpz07zSHB00TpugqhmYtVmMO6518mCuRMoOYFldEBl0g187ufozdaHgWKcYFb61qGiA==";
      };
    };
    "chalk-1.1.3" = {
      name = "chalk";
      packageName = "chalk";
      version = "1.1.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/chalk/-/chalk-1.1.3.tgz";
        sha1 = "a8115c55e4a702fe4d150abd3872822a7e09fc98";
      };
    };
    "colors-0.6.2" = {
      name = "colors";
      packageName = "colors";
      version = "0.6.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/colors/-/colors-0.6.2.tgz";
        sha1 = "2423fe6678ac0c5dae8852e5d0e5be08c997abcc";
      };
    };
    "concat-map-0.0.1" = {
      name = "concat-map";
      packageName = "concat-map";
      version = "0.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/concat-map/-/concat-map-0.0.1.tgz";
        sha1 = "d8a96bd77fd68df7793a73036a3ba0d5405d477b";
      };
    };
    "cycle-1.0.3" = {
      name = "cycle";
      packageName = "cycle";
      version = "1.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/cycle/-/cycle-1.0.3.tgz";
        sha1 = "21e80b2be8580f98b468f379430662b046c34ad2";
      };
    };
    "deep-equal-1.0.1" = {
      name = "deep-equal";
      packageName = "deep-equal";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/deep-equal/-/deep-equal-1.0.1.tgz";
        sha1 = "f5d260292b660e084eff4cdbc9f08ad3247448b5";
      };
    };
    "escape-string-regexp-1.0.5" = {
      name = "escape-string-regexp";
      packageName = "escape-string-regexp";
      version = "1.0.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp-1.0.5.tgz";
        sha1 = "1b61c0562190a8dff6ae3bb2cf0200ca130b86d4";
      };
    };
    "eyes-0.1.8" = {
      name = "eyes";
      packageName = "eyes";
      version = "0.1.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/eyes/-/eyes-0.1.8.tgz";
        sha1 = "62cf120234c683785d902348a800ef3e0cc20bc0";
      };
    };
    "fs.realpath-1.0.0" = {
      name = "fs.realpath";
      packageName = "fs.realpath";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/fs.realpath/-/fs.realpath-1.0.0.tgz";
        sha1 = "1504ad2523158caa40db4a2787cb01411994ea4f";
      };
    };
    "glob-7.1.3" = {
      name = "glob";
      packageName = "glob";
      version = "7.1.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/glob/-/glob-7.1.3.tgz";
        sha512 = "vcfuiIxogLV4DlGBHIUOwI0IbrJ8HWPc4MU7HzviGeNho/UJDfi6B5p3sHeWIQ0KGIU0Jpxi5ZHxemQfLkkAwQ==";
      };
    };
    "has-ansi-2.0.0" = {
      name = "has-ansi";
      packageName = "has-ansi";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/has-ansi/-/has-ansi-2.0.0.tgz";
        sha1 = "34f5049ce1ecdf2b0649af3ef24e45ed35416d91";
      };
    };
    "i-0.3.6" = {
      name = "i";
      packageName = "i";
      version = "0.3.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/i/-/i-0.3.6.tgz";
        sha1 = "d96c92732076f072711b6b10fd7d4f65ad8ee23d";
      };
    };
    "inflight-1.0.6" = {
      name = "inflight";
      packageName = "inflight";
      version = "1.0.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/inflight/-/inflight-1.0.6.tgz";
        sha1 = "49bd6331d7d02d0c09bc910a1075ba8165b56df9";
      };
    };
    "inherits-2.0.3" = {
      name = "inherits";
      packageName = "inherits";
      version = "2.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/inherits/-/inherits-2.0.3.tgz";
        sha1 = "633c2c83e3da42a502f52466022480f4208261de";
      };
    };
    "isstream-0.1.2" = {
      name = "isstream";
      packageName = "isstream";
      version = "0.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/isstream/-/isstream-0.1.2.tgz";
        sha1 = "47e63f7af55afa6f92e1500e690eb8b8529c099a";
      };
    };
    "minimatch-3.0.4" = {
      name = "minimatch";
      packageName = "minimatch";
      version = "3.0.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/minimatch/-/minimatch-3.0.4.tgz";
        sha512 = "yJHVQEhyqPLUTgt9B83PXu6W3rx4MvvHvSUvToogpwoGDOUQ+yDrR0HRot+yOCdCO7u4hX3pWft6kWBBcqh0UA==";
      };
    };
    "minimist-0.0.8" = {
      name = "minimist";
      packageName = "minimist";
      version = "0.0.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/minimist/-/minimist-0.0.8.tgz";
        sha1 = "857fcabfc3397d2625b8228262e86aa7a011b05d";
      };
    };
    "minimist-1.2.0" = {
      name = "minimist";
      packageName = "minimist";
      version = "1.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/minimist/-/minimist-1.2.0.tgz";
        sha1 = "a35008b20f41383eec1fb914f4cd5df79a264284";
      };
    };
    "mkdirp-0.5.1" = {
      name = "mkdirp";
      packageName = "mkdirp";
      version = "0.5.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/mkdirp/-/mkdirp-0.5.1.tgz";
        sha1 = "30057438eac6cf7f8c4767f38648d6697d75c903";
      };
    };
    "mute-stream-0.0.8" = {
      name = "mute-stream";
      packageName = "mute-stream";
      version = "0.0.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/mute-stream/-/mute-stream-0.0.8.tgz";
        sha512 = "nnbWWOkoWyUsTjKrhgD0dcz22mdkSnpYqbEjIm2nhwhuxlSkpywJmBo8h0ZqJdkp73mb90SssHkN4rsRaBAfAA==";
      };
    };
    "ncp-0.4.2" = {
      name = "ncp";
      packageName = "ncp";
      version = "0.4.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/ncp/-/ncp-0.4.2.tgz";
        sha1 = "abcc6cbd3ec2ed2a729ff6e7c1fa8f01784a8574";
      };
    };
    "once-1.4.0" = {
      name = "once";
      packageName = "once";
      version = "1.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/once/-/once-1.4.0.tgz";
        sha1 = "583b1aa775961d4b113ac17d9c50baef9dd76bd1";
      };
    };
    "path-is-absolute-1.0.1" = {
      name = "path-is-absolute";
      packageName = "path-is-absolute";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/path-is-absolute/-/path-is-absolute-1.0.1.tgz";
        sha1 = "174b9268735534ffbc7ace6bf53a5a9e1b5c5f5f";
      };
    };
    "pkginfo-0.3.1" = {
      name = "pkginfo";
      packageName = "pkginfo";
      version = "0.3.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/pkginfo/-/pkginfo-0.3.1.tgz";
        sha1 = "5b29f6a81f70717142e09e765bbeab97b4f81e21";
      };
    };
    "pkginfo-0.4.1" = {
      name = "pkginfo";
      packageName = "pkginfo";
      version = "0.4.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/pkginfo/-/pkginfo-0.4.1.tgz";
        sha1 = "b5418ef0439de5425fc4995042dced14fb2a84ff";
      };
    };
    "prompt-0.2.14" = {
      name = "prompt";
      packageName = "prompt";
      version = "0.2.14";
      src = fetchurl {
        url = "https://registry.npmjs.org/prompt/-/prompt-0.2.14.tgz";
        sha1 = "57754f64f543fd7b0845707c818ece618f05ffdc";
      };
    };
    "read-1.0.7" = {
      name = "read";
      packageName = "read";
      version = "1.0.7";
      src = fetchurl {
        url = "https://registry.npmjs.org/read/-/read-1.0.7.tgz";
        sha1 = "b3da19bd052431a97671d44a42634adf710b40c4";
      };
    };
    "revalidator-0.1.8" = {
      name = "revalidator";
      packageName = "revalidator";
      version = "0.1.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/revalidator/-/revalidator-0.1.8.tgz";
        sha1 = "fece61bfa0c1b52a206bd6b18198184bdd523a3b";
      };
    };
    "rimraf-2.6.3" = {
      name = "rimraf";
      packageName = "rimraf";
      version = "2.6.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/rimraf/-/rimraf-2.6.3.tgz";
        sha512 = "mwqeW5XsA2qAejG46gYdENaxXjx9onRNCfn7L0duuP4hCuTIi/QO7PDK07KJfp1d+izWPrzEJDcSqBa0OZQriA==";
      };
    };
    "semver-5.6.0" = {
      name = "semver";
      packageName = "semver";
      version = "5.6.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/semver/-/semver-5.6.0.tgz";
        sha512 = "RS9R6R35NYgQn++fkDWaOmqGoj4Ek9gGs+DPxNUZKuwE183xjJroKvyo1IzVFeXvUrvmALy6FWD5xrdJT25gMg==";
      };
    };
    "stack-trace-0.0.10" = {
      name = "stack-trace";
      packageName = "stack-trace";
      version = "0.0.10";
      src = fetchurl {
        url = "https://registry.npmjs.org/stack-trace/-/stack-trace-0.0.10.tgz";
        sha1 = "547c70b347e8d32b4e108ea1a2a159e5fdde19c0";
      };
    };
    "strip-ansi-3.0.1" = {
      name = "strip-ansi";
      packageName = "strip-ansi";
      version = "3.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/strip-ansi/-/strip-ansi-3.0.1.tgz";
        sha1 = "6a385fb8853d952d5ff05d0e8aaf94278dc63dcf";
      };
    };
    "supports-color-2.0.0" = {
      name = "supports-color";
      packageName = "supports-color";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/supports-color/-/supports-color-2.0.0.tgz";
        sha1 = "535d045ce6b6363fa40117084629995e9df324c7";
      };
    };
    "utile-0.2.1" = {
      name = "utile";
      packageName = "utile";
      version = "0.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/utile/-/utile-0.2.1.tgz";
        sha1 = "930c88e99098d6220834c356cbd9a770522d90d7";
      };
    };
    "winston-0.8.3" = {
      name = "winston";
      packageName = "winston";
      version = "0.8.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/winston/-/winston-0.8.3.tgz";
        sha1 = "64b6abf4cd01adcaefd5009393b1d8e8bec19db0";
      };
    };
    "wrappy-1.0.2" = {
      name = "wrappy";
      packageName = "wrappy";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/wrappy/-/wrappy-1.0.2.tgz";
        sha1 = "b5243d8f3ec1aa35f1364605bc0d1036e30ab69f";
      };
    };
  };
in
{
  "react-native-cli-2.0.1" = nodeEnv.buildNodePackage {
    name = "react-native-cli";
    packageName = "react-native-cli";
    version = "2.0.1";
    src = fetchurl {
      url = "https://registry.npmjs.org/react-native-cli/-/react-native-cli-2.0.1.tgz";
      sha1 = "f2cd3c7aa1b83828cdfba630e2dfd817df766d54";
    };
    dependencies = [
      sources."ansi-regex-2.1.1"
      sources."ansi-styles-2.2.1"
      sources."async-0.2.10"
      sources."balanced-match-1.0.0"
      sources."brace-expansion-1.1.11"
      sources."chalk-1.1.3"
      sources."colors-0.6.2"
      sources."concat-map-0.0.1"
      sources."cycle-1.0.3"
      sources."deep-equal-1.0.1"
      sources."escape-string-regexp-1.0.5"
      sources."eyes-0.1.8"
      sources."fs.realpath-1.0.0"
      sources."glob-7.1.3"
      sources."has-ansi-2.0.0"
      sources."i-0.3.6"
      sources."inflight-1.0.6"
      sources."inherits-2.0.3"
      sources."isstream-0.1.2"
      sources."minimatch-3.0.4"
      sources."minimist-1.2.0"
      (sources."mkdirp-0.5.1" // {
        dependencies = [
          sources."minimist-0.0.8"
        ];
      })
      sources."mute-stream-0.0.8"
      sources."ncp-0.4.2"
      sources."once-1.4.0"
      sources."path-is-absolute-1.0.1"
      sources."pkginfo-0.4.1"
      sources."prompt-0.2.14"
      sources."read-1.0.7"
      sources."revalidator-0.1.8"
      sources."rimraf-2.6.3"
      sources."semver-5.6.0"
      sources."stack-trace-0.0.10"
      sources."strip-ansi-3.0.1"
      sources."supports-color-2.0.0"
      sources."utile-0.2.1"
      (sources."winston-0.8.3" // {
        dependencies = [
          sources."pkginfo-0.3.1"
        ];
      })
      sources."wrappy-1.0.2"
    ];
    buildInputs = globalBuildInputs;
    meta = {
      description = "The React Native CLI tools";
      homepage = "https://github.com/facebook/react-native#readme";
      license = "BSD-3-Clause";
    };
    production = true;
    bypassCache = true;
  };
}