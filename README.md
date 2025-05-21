# Monster Spinner

spinner animation ! with [Godot](https://godotengine.org/)

![film of spinner](example.gif)

## Image scripts

resize images and pad with white background

```bash
imagesize="400x600"
for img in raw/*.png; do
  file="${img#*/}"
	convert "${img}" -resize "${imagesize}" -background white -gravity center -extent "${imagesize}" "resized/${file}"
done
```

combine images into a carousel

```bash
convert resized/monster{01,02,03,04,05}.png -append -rotate 90 spinner1.png
convert resized/monster{06,07,08,09,10}.png -append -rotate 90 spinner2.png
```

## export MP4

export movie like so: <https://docs.godotengine.org/en/stable/tutorials/animation/creating_movies.html> (i.e., set movie export location, click movie button, and play game)
