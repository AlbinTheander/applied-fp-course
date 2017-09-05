{-# LANGUAGE OverloadedStrings #-}
module FirstApp.Main (runApp) where

import           Network.Wai
import           Network.Wai.Handler.Warp (run)

import           Network.HTTP.Types       (Status, hContentType, status200,
                                           status400, status404)

import qualified Data.ByteString.Lazy     as LBS

import           Data.Either              (either)

import           Data.Text                (Text)
import           Data.Text.Encoding       (decodeUtf8)

import           FirstApp.Types


-- ---------------------------------------------|
--  Don't start here, go to FirstApp.Types! :)  |
-- ---------------------------------------------|

-- | Some helper functions to make our lives a little more DRY.
mkResponse
  :: Status
  -> ContentType
  -> LBS.ByteString
  -> Response
mkResponse =
  error "mkResponse not implemented"

resp200
  :: ContentType
  -> LBS.ByteString
  -> Response
resp200 =
  error "resp200 not implemented"

resp404
  :: ContentType
  -> LBS.ByteString
  -> Response
resp404 =
  error "resp404 not implemented"

resp400
  :: ContentType
  -> LBS.ByteString
  -> Response
resp400 =
  error "resp400 not implemented"
-- |

-- These next few functions will take the raw request information and turn it
-- into one of our data types. This means we draw a line about where the unruly
-- outside world must end, and where the well-typed world of our application
-- begins.
mkAddRequest
  :: Text
  -> LBS.ByteString
  -> Either Error RqType
mkAddRequest =
  error "mkAddRequest not implemented"

-- This has other benefits, we're able isolate our validation requirements into
-- the smallest chunks we can manage. This allows for fantastic reuse and it
-- also means that validation is not spread across the application. It is kept
-- at the borders.
mkViewRequest
  :: Text
  -> Either Error RqType
mkViewRequest =
  error "mkViewRequest not implemented"

-- Even though it may seem too trivial or even pointless to write functions such
-- as these it allows for much greater consistency across the application.

-- Some of these are straight forward data constructors, but by doing it this
-- way we don't have any snowflakes littered about the code. It also enhances
-- our ability to spot larger patterns in our application, which are
-- opportunities for abstraction.
mkListRequest
  :: Either Error RqType
mkListRequest =
  error "mkListRequest not implemented"

mkUnknownRouteErr
  :: Either Error a
mkUnknownRouteErr =
  error "mkUnknownRouteErr not implemented"

mkErrorResponse
  :: Error
  -> Response
mkErrorResponse =
  error "mkErrorResponse not implemented"


-- Lets use our ``RqType`` helpers to now write a function that will take the
-- input ``Request`` from the Wai library and turn it into something our
-- application cares about.
mkRequest
  :: Request
  -> IO ( Either Error RqType )
mkRequest =
  error "mkRequest not implemented"

-- In this next function, notice how we're only accepting our predefined request
-- types that have the required information already validated and prepared for
-- use in the handling of the request.
--
-- If we find that we need more information to handle a request, or we have a
-- new type of request that we'd like to handle then we update the ``RqType``
-- structure and the compiler will let us know which parts of our application
-- are affected.
--
-- Reduction of concerns such that each section of the application only deals
-- with a small piece is one of the benefits of developing in this way.
handleRequest
  :: RqType
  -> Either Error Response
handleRequest _ =
  error "handleRequest not implemented"

-- Reimplement this function using the new functions and the ``RqType``
-- constructors as a guide.
app
  :: Application
app =
  error "app not reimplemented"

runApp :: IO ()
runApp = run 3000 app
