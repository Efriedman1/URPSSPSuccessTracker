USE [CIS4396S04]
GO

DECLARE	@return_value Int

EXEC	@return_value = [dbo].[GetTermByStudent]
		@StudentTUID = N'915576335'

SELECT	@return_value as 'Return Value'

GO
