import { cn } from "@/common/utils/cn";
import { cva, VariantProps } from "class-variance-authority";
import { type ButtonHTMLAttributes, forwardRef } from "react";
import { Slot } from "@radix-ui/react-slot";

const buttonVariants = cva(
  "text-sm rounded-sm font-medium inline-flex items-center justify-center transition gap-2",
  {
    variants: {
      variant: {
        ghost:
          "hover:bg-primary/50 active:bg-primary/30 text-foreground hover:text-primary-foreground",
      },
      size: {
        default: "h-5 px-2",
        icon: "size-5 px-0",
      },
    },
    defaultVariants: {
      size: "default",
    },
  },
);

export type ButtonProps = ButtonHTMLAttributes<HTMLButtonElement> &
  VariantProps<typeof buttonVariants> & {
    asChild?: boolean;
  };

export const Button = forwardRef<HTMLButtonElement, ButtonProps>(
  ({ asChild = false, className, variant, size, ...props }, ref) => {
    const Comp = asChild ? Slot : "button";
    return (
      <Comp
        className={cn(buttonVariants({ size, variant, className }))}
        ref={ref}
        {...props}
      />
    );
  },
);
Button.displayName = "Button";
