[org 0x7c00]
[bits 16]

;Boot Loader
mov bx , 0x1000 ; Memory offset to which kernel will be loaded
mov ah , 0x02   ; Bios Read Sector Function
mov al , 30     ; No. of sectors to read(If your kernel won't fit into 30 sectors , you may need to provide the correct no. of sectors to read)
mov ch , 0x00   ; Select Cylinder 0 from harddisk
mov dh , 0x00   ; Select head 0 from hard disk
mov cl , 0x02   ; Start Reading from Second sector(Sector just after boot sector)

int 0x13        ; Bios Interrupt Relating to Disk functions

