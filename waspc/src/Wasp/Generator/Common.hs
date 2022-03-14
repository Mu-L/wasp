module Wasp.Generator.Common
  ( ProjectRootDir,
    getMajor,
    nodeVersion,
    nodeSemverString,
    npmSemverString,
    prismaSemverString,
  )
where

import Text.Printf (printf)

-- | Directory where the whole web app project (client, server, ...) is generated.
data ProjectRootDir

type SemanticVersion = (Int, Int, Int)

compatibleWith :: String
compatibleWith = "^"

getMajor :: SemanticVersion -> Int
getMajor (major, _, _) = major

-- | Node version that node packages generated by this generator expect.
--   (major, minor, patch)
nodeVersion :: SemanticVersion
nodeVersion = (16, 0, 0) -- Latest LTS version.

nodeSemverString :: String
nodeSemverString = makeSemverString compatibleWith nodeVersion

npmVersion :: SemanticVersion
npmVersion = (8, 0, 0) -- Latest LTS version.

npmSemverString :: String
npmSemverString = makeSemverString compatibleWith npmVersion

prismaVersion :: SemanticVersion
prismaVersion = (3, 9, 1)

prismaSemverString :: String
prismaSemverString = makeSemverString "" prismaVersion

makeSemverString :: String -> SemanticVersion -> String
makeSemverString prefix version = prefix ++ versionAsText version

versionAsText :: SemanticVersion -> String
versionAsText (major, minor, patch) = printf "%d.%d.%d" major minor patch
