# line-rich-message-image-resizer

line-rich-message-image-resizer is a image resize server for LINE RichMessage.

- [RichMessage API Reference](https://developers.line.me/bot-api/api-reference#sending_rich_content_message)

> The width which the LINE app uses depends on the screen resolution of the user’s device. The LINE app automatically decides on the URL to fetch the optimal image.
> 
> - Width 1040px: DOWNLOAD_URL/1040
> - Width 700px: DOWNLOAD_URL/700
> - Width 460px: DOWNLOAD_URL/460
> - Width 300px: DOWNLOAD_URL/300
> - Width 240px: DOWNLOAD_URL/240
> 
> For example, if the DOWNLOAD_URL is “http://example.com/imgs/face” and the LINE app requires “700px”, the following URL will be requested:
> 
> - http://example.com/imgs/face/700

## Usage

- http://example.com/{IMAGE_URL}/{IMAGE_SIZE}

For example,

- http://line-rich-message-image-resizer.exmaple.com/image.example.com/test.png/1040

## License

[MIT License](https://github.com/shunirr/line-rich-message-test/blob/master/LICENSE.txt)

