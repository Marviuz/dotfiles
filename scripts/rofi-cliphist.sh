#!/bin/bash

# Rofi clipboard history with image previews
# Based on your wallpaper script pattern

# Create temp directory for image files
TEMP_DIR=$(mktemp -d)

# Process clipboard entries and create temp image files
cliphist list | while IFS= read -r entry; do
    if [[ -n "$entry" ]]; then
        # Create temp file
        temp_file="$TEMP_DIR/clip_$entry"
        cliphist decode <<< "$entry" > "$temp_file" 2>/dev/null
        
        # Check if it's an image
        file_type=$(file -b --mime-type "$temp_file" 2>/dev/null)
        
        if echo "$file_type" | grep -q "image/"; then
            # It's an image - show with image preview
            size=$(stat -c%s "$temp_file" 2>/dev/null)
            size_human=$(numfmt --to=iec --suffix=B "$size" 2>/dev/null || echo "${size}B")
            echo -en "🖼️ Image (${size_human})\0icon\x1f$temp_file\n"
        else
            # It's text - show text preview
            content=$(cat "$temp_file" 2>/dev/null | head -c 50)
            if [[ ${#content} -eq 50 ]]; then
                content="${content}..."
            fi
            echo -en "📝 $content\0icon\x1f\n"
        fi
    fi
done | rofi -dmenu -format 't\0i' -i -config ~/.config/rofi/config.rasi | {
    # Get the selected text
    selected_text=$(cat)
    if [[ -n "$selected_text" ]]; then
        # Find the corresponding entry
        cliphist list | while IFS= read -r entry; do
            temp_file="$TEMP_DIR/clip_$entry"
            if [[ -f "$temp_file" ]]; then
                file_type=$(file -b --mime-type "$temp_file" 2>/dev/null)
                
                if echo "$file_type" | grep -q "image/"; then
                    size=$(stat -c%s "$temp_file" 2>/dev/null)
                    size_human=$(numfmt --to=iec --suffix=B "$size" 2>/dev/null || echo "${size}B")
                    display_text="🖼️ Image (${size_human})"
                else
                    content=$(cat "$temp_file" 2>/dev/null | head -c 50)
                    if [[ ${#content} -eq 50 ]]; then
                        content="${content}..."
                    fi
                    display_text="📝 $content"
                fi
                
                if [[ "$display_text" == "$selected_text" ]]; then
                    cliphist decode <<< "$entry" | wl-copy
                    break
                fi
            fi
        done
    fi
    
    # Cleanup
    rm -rf "$TEMP_DIR"
}