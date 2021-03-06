{-# LANGUAGE OverloadedStrings #-}
import Data.Monoid (mappend)
import Data.Monoid
import Hakyll

main :: IO ()
main = hakyllWith config $ do
    match "CNAME" $ do
        route   idRoute
        compile copyFileCompiler

    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "images/pics/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match "js/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "fonts/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "bower_components/**" $ do
        route   idRoute
        compile copyFileCompiler

    match "index.html" $ do
        route idRoute
        compile $ do
            let indexCtx = constField "title" "Venabili Keyboard" <> defaultContext
            getResourceBody
                >>= applyAsTemplate indexCtx
                >>= loadAndApplyTemplate "templates/default.html" indexCtx
                >>= relativizeUrls

    match "pics.md" $ do
        route   $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/pics.html" defaultContext
            >>= relativizeUrls

    match "templates/*" $ compile templateBodyCompiler


config :: Configuration
config = defaultConfiguration { destinationDirectory = "docs" }
