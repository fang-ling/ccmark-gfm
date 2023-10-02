// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "lgy",
  products: [
    .library(name: "cmark-gfm", targets: ["cmark-gfm"]),
    .library(name: "cmark-gfm-extensions", targets: ["cmark-gfm-extensions"]),
  ],
  targets: [
    .target(
      name: "cmark-gfm",
      path: "src",
      exclude: [
        "scanners.re",
        "libcmark-gfm.pc.in",
        "config.h.in",
        "CMakeLists.txt",
        "cmark-gfm_version.h.in",
      ]
    ),
    .target(
      name: "cmark-gfm-extensions",
      dependencies: [
        "cmark-gfm",
      ],
      path: "extensions",
      exclude: [
        "CMakeLists.txt",
        "ext_scanners.re",
      ]
    ),
    .executableTarget(
      name: "cmark-gfm-bin",
      dependencies: [
        "cmark-gfm",
        "cmark-gfm-extensions",
      ],
      path: "bin",
      sources: [
        "main.c",
      ]
    ),
    .executableTarget(
      name: "api_test",
      dependencies: [
        "cmark-gfm",
        "cmark-gfm-extensions",
      ],
      path: "api_test",
      exclude: [
        "CMakeLists.txt",
      ]
    )
  ]
)
